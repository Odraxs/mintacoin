defmodule Mintacoin.Payments do
  @moduledoc """
  This module is the responsible for the CRUD operations for payment
  """

  import Ecto.Query

  alias Ecto.{Changeset, UUID}

  alias Mintacoin.{
    Account,
    AssetHolder,
    AssetHolders,
    Balance,
    Balances,
    Payment,
    Repo,
    Wallet,
    Wallets
  }

  alias Mintacoin.Payments.Workers.CreatePayment, as: CreatePaymentWorker

  @type address :: String.t()
  @type amount :: String.t() | integer() | float()
  @type asset_holder :: {:ok, AssetHolder.t()}
  @type balances :: Balance.t() | []
  @type error :: Changeset.t()
  @type id :: UUID.t()
  @type params :: map()
  @type payment :: Payment.t()
  @type payments :: list(payment) | []
  @type signature :: String.t()

  def create(%{
        source_signature: source_signature,
        source_account_id: source_account_id,
        destination_account_id: destination_account_id,
        blockchain_id: blockchain_id,
        asset_id: asset_id,
        amount: amount
      }) do
    with {:ok, amount} <- validate_amount(amount),
         {:ok, %Wallet{id: source_wallet_id}} <-
           Wallets.retrieve_by_account_id_and_blockchain_id(source_account_id, blockchain_id),
         {:ok, %Wallet{id: destination_wallet_id}} <-
           Wallets.retrieve_by_account_id_and_blockchain_id(destination_account_id, blockchain_id),
         {:ok, __asset_holder} <- validate_asset_trustline(destination_wallet_id, asset_id),
         {:ok, _source_balance} <-
           validate_source_funds(source_wallet_id, asset_id, amount) do
      {:ok, payment} =
        %{
          blockchain_id: blockchain_id,
          source_account_id: source_account_id,
          destination_account_id: destination_account_id,
          asset_id: asset_id,
          amount: amount,
          successful: false
        }
        |> create_db_record()

      %{
        source_signature: source_signature,
        source_wallet_id: source_wallet_id,
        destination_wallet_id: destination_wallet_id,
        blockchain_id: blockchain_id,
        asset_id: asset_id,
        amount: amount
      }
      |> dispatch_crate_payment_job(payment)
    end
  end

  @spec create_db_record(params :: params()) :: {:ok, payment()} | {:error, error()}
  def create_db_record(params) do
    %Payment{}
    |> Payment.create_changeset(params)
    |> Repo.insert()
  end

  @spec update(payment_id :: id(), changes :: params()) :: {:ok, payment()} | {:error, error()}
  def update(id, changes) do
    Payment
    |> Repo.get(id)
    |> Payment.changeset(changes)
    |> Repo.update()
  end

  @spec retrieve_by_id(id :: id()) :: {:ok, payment() | nil}
  def retrieve_by_id(id), do: {:ok, Repo.get(Payment, id)}

  @spec retrieve_outgoing_payments_by_address(address :: address()) :: {:ok, payments()}
  def retrieve_outgoing_payments_by_address(address) do
    query =
      from(payment in Payment,
        join: account in Account,
        on: payment.source_account_id == account.id,
        where: account.address == ^address
      )

    {:ok, Repo.all(query)}
  end

  @spec retrieve_incoming_payments_by_address(address :: address()) :: {:ok, payments()}
  def retrieve_incoming_payments_by_address(address) do
    query =
      from(payment in Payment,
        join: account in Account,
        on: payment.destination_account_id == account.id,
        where: account.address == ^address
      )

    {:ok, Repo.all(query)}
  end

  @spec dispatch_crate_payment_job(
          %{
            :amount => amount(),
            :asset_id => id(),
            :blockchain_id => id(),
            :destination_wallet_id => id(),
            :source_signature => signature(),
            :source_wallet_id => id()
          },
          payment :: payment()
        ) :: {:ok, payment()}
  defp dispatch_crate_payment_job(
         %{
           source_signature: source_signature,
           source_wallet_id: source_wallet_id,
           destination_wallet_id: destination_wallet_id,
           blockchain_id: blockchain_id,
           asset_id: asset_id,
           amount: amount
         },
         payment
       ) do
    %{id: payment_id} = payment

    %{
      source_signature: source_signature,
      source_wallet_id: source_wallet_id,
      destination_wallet_id: destination_wallet_id,
      blockchain_id: blockchain_id,
      asset_id: asset_id,
      amount: amount,
      payment_id: payment_id
    }
    |> CreatePaymentWorker.new()
    |> Oban.insert()

    {:ok, payment}
  end

  @spec validate_amount(amount :: amount()) :: {:ok, amount()} | {:error, error()}
  defp validate_amount(amount) do
    with {:ok, number} <- Decimal.cast(amount),
         true <- Decimal.gt?(number, "0") do
      {:ok, Decimal.to_string(number)}
    else
      _error -> {:error, :invalid_supply_format}
    end
  end

  @spec validate_asset_trustline(wallet_id :: id(), asset_id :: id()) ::
          {:error, nil} | {:ok, asset_holder()}
  defp validate_asset_trustline(wallet_id, asset_id) do
    asset_holder = AssetHolders.retrieve_by_wallet_id_and_asset_id(wallet_id, asset_id)

    case asset_holder do
      {:ok, nil} -> {:error, nil}
      _any -> {:ok, asset_holder}
    end
  end

  @spec validate_source_funds(source_wallet_id :: id(), asset_id :: id(), amount :: amount()) ::
          {:error, amount()} | {:ok, amount()}
  defp validate_source_funds(source_wallet_id, asset_id, payment_amount) do
    {:ok, %Balance{balance: balance}} =
      Balances.retrieve_by_wallet_id_and_asset_id(source_wallet_id, asset_id)

    {:ok, payment_amount} = Decimal.cast(payment_amount)
    {:ok, source_balance} = Decimal.cast(balance)
    difference = Decimal.sub(source_balance, payment_amount)

    if Decimal.negative?(difference) do
      {:error, balance}
    else
      {:ok, balance}
    end
  end
end
