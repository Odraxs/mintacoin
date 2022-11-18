defmodule Mintacoin.Accounts.StellarMock do
  @moduledoc """
  Mock implementation of the Stellar crypto functions for accounts
  """

  alias Mintacoin.Accounts.{Crypto.AccountResponse, Keypair}

  @behaviour Mintacoin.Accounts.Crypto.Spec

  @impl true
  def create_account(_opts) do
    {:ok, {secret_key, public_key}} = Keypair.random()

    {:ok,
     %AccountResponse{
       public_key: public_key,
       secret_key: secret_key,
       successful: Enum.random([true, false]),
       tx_id: "7f82fe6ac195e7674f7bdf7a3416683ffd55c8414978c70bf4da08ac64fea129",
       tx_hash: "7f82fe6ac195e7674f7bdf7a3416683ffd55c8414978c70bf4da08ac64fea129",
       tx_timestamp: DateTime.to_string(~U[2022-06-29 15:45:45Z]),
       tx_response: %{
         created_at: ~U[2022-06-29 15:45:45Z],
         envelope_xdr:
           "AAAAAgAAAAA1g28UW2dCMYtvD0hVfw7+ZM8SjnB/HzQq7lGIRlLuiwAAAGQAAc5vAAAAAQAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAADqwUtg1Z2W2ioK5oidVOy7ezJidLD4oJ6sdOFj6QzNKAAAAAAExLQAAAAAAAAAAAUZS7osAAABAZ8AKJ6GiyYoHUO0wIGcbGe1egu7K1D5K4y50XmF9aRjoD9lxXsIl27Np6k4RJ0h/gqUCxrX2lBY0AhzkzfDjCw==",
         fee_charged: 100,
         fee_meta_xdr:
           "AAAAAgAAAAMAAc5vAAAAAAAAAAA1g28UW2dCMYtvD0hVfw7+ZM8SjnB/HzQq7lGIRlLuiwAAABdIdugAAAHObwAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAEAAc9kAAAAAAAAAAA1g28UW2dCMYtvD0hVfw7+ZM8SjnB/HzQq7lGIRlLuiwAAABdIduecAAHObwAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAA==",
         hash: "7f82fe6ac195e7674f7bdf7a3416683ffd55c8414978c70bf4da08ac64fea129",
         id: "7f82fe6ac195e7674f7bdf7a3416683ffd55c8414978c70bf4da08ac64fea129",
         ledger: 118_628,
         max_fee: 100,
         memo: nil,
         memo_type: "none",
         operation_count: 1,
         paging_token: "509503380414464",
         result_meta_xdr:
           "AAAAAgAAAAIAAAADAAHPZAAAAAAAAAAANYNvFFtnQjGLbw9IVX8O/mTPEo5wfx80Ku5RiEZS7osAAAAXSHbnnAABzm8AAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAABAAHPZAAAAAAAAAAANYNvFFtnQjGLbw9IVX8O/mTPEo5wfx80Ku5RiEZS7osAAAAXSHbnnAABzm8AAAABAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAwAAAAAAAc9kAAAAAGK8c6kAAAAAAAAAAQAAAAMAAAADAAHPZAAAAAAAAAAANYNvFFtnQjGLbw9IVX8O/mTPEo5wfx80Ku5RiEZS7osAAAAXSHbnnAABzm8AAAABAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAwAAAAAAAc9kAAAAAGK8c6kAAAAAAAAAAQABz2QAAAAAAAAAADWDbxRbZ0Ixi28PSFV/Dv5kzxKOcH8fNCruUYhGUu6LAAAAF0dFupwAAc5vAAAAAQAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAAMAAAAAAAHPZAAAAABivHOpAAAAAAAAAAAAAc9kAAAAAAAAAAA6sFLYNWdltoqCuaInVTsu3syYnSw+KCerHThY+kMzSgAAAAABMS0AAAHPZAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAA=",
         result_xdr: "AAAAAAAAAGQAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAA=",
         signatures: [
           "Z8AKJ6GiyYoHUO0wIGcbGe1egu7K1D5K4y50XmF9aRjoD9lxXsIl27Np6k4RJ0h/gqUCxrX2lBY0AhzkzfDjCw=="
         ],
         source_account: "GBYYS5GDK3ODHWSB6THERJMBQ25P7EM2MFQ4PP7RA6BO6DTUZKW236CD",
         source_account_sequence: 508_451_113_402_369,
         successful: true,
         valid_after: nil,
         valid_before: nil
       }
     }}
  end
end
