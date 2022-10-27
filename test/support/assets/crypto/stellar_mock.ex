defmodule Mintacoin.Assets.StellarMock do
  @moduledoc """
  Mock implementation of the Stellar crypto functions for accounts
  """

  alias Mintacoin.Assets.Crypto.AssetResponse

  @behaviour Mintacoin.Assets.Crypto.Spec

  @impl true
  def create_asset(_opts) do
    default_status = Enum.random([true, false])

    {:ok,
     %AssetResponse{
       successful: Application.get_env(:stellar_mock, :tx_status, default_status),
       tx_id: "cda25a0c343a411a3ca2927d48454abaff9ccbebd8a5c292695d0aec30b133ca",
       tx_hash: "cda25a0c343a411a3ca2927d48454abaff9ccbebd8a5c292695d0aec30b133ca",
       tx_timestamp: DateTime.to_string(~U[2022-09-27 20:16:51Z]),
       tx_response: %{
         id: "cda25a0c343a411a3ca2927d48454abaff9ccbebd8a5c292695d0aec30b133ca",
         paging_token: "949651628900352",
         successful: true,
         hash: "cda25a0c343a411a3ca2927d48454abaff9ccbebd8a5c292695d0aec30b133ca",
         ledger: 221_108,
         created_at: ~U[2022-09-27 20:16:51Z],
         source_account: "GCPJ7XVQQX5TZPWAAQL5D2CMLUGDW3YX4RU3BXLCV7P6A3W4ED4GWWHQ",
         source_account_sequence: 523_655_297_630_239,
         fee_charged: 200,
         max_fee: 200,
         operation_count: 2,
         envelope_xdr:
           "AAAAAgAAAACen96whfs8vsAEF9HoTF0MO28X5Gmw3WKv3+Bu3CD4awAAAMgAAdxDAAAAHwAAAAAAAAAAAAAAAgAAAAEAAAAAXk6d53lwhwhMKH7gvTSbLfBsmCmFkMQzXzlmhsu7/J8AAAAGAAAAAUFBQQAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAABKgXyAAAAAAEAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAABAAAAAF5Oned5cIcITCh+4L00my3wbJgphZDEM185ZobLu/yfAAAAAUFBQQAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAABKgXyAAAAAAAAAAAC3CD4awAAAEBvOzxbn41Nin1s3D1rhY9R7Z/sB8Qh/XFHq5XXi5eZAuhBStsxQ7woN/3LkjLiddXJsJKKRv8ckts8Ac0nq4QEy7v8nwAAAECfxRaO8+zZtlwOWxVcDyJSR/7hpg+UhTwp1b0wMj8PWIdRUNRZnt+6nV+G7ggwkx1HGdZEzmclqIuGO4/yUb4D",
         result_xdr: "AAAAAAAAAMgAAAAAAAAAAgAAAAAAAAAGAAAAAAAAAAAAAAABAAAAAAAAAAA=",
         result_meta_xdr:
           "AAAAAgAAAAIAAAADAANftAAAAAAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAAXOii9jAAB3EMAAAAeAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAwAAAAAAA19PAAAAAGMzWBcAAAAAAAAAAQADX7QAAAAAAAAAAJ6f3rCF+zy+wAQX0ehMXQw7bxfkabDdYq/f4G7cIPhrAAAAFzoovYwAAdxDAAAAHwAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAAMAAAAAAANftAAAAABjM1ozAAAAAAAAAAIAAAADAAAAAAADX7QAAAABAAAAAF5Oned5cIcITCh+4L00my3wbJgphZDEM185ZobLu/yfAAAAAUFBQQAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAAAAAAAAAAAAAEqBfIAAAAAAQAAAAAAAAAAAAAAAwADX2kAAAAAAAAAAF5Oned5cIcITCh+4L00my3wbJgphZDEM185ZobLu/yfAAAAC6TUCVQAA1JuAAAAAgAAAAIAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAAMAAAAAAANfaQAAAABjM1ijAAAAAAAAAAEAA1+0AAAAAAAAAABeTp3neXCHCEwofuC9NJst8GyYKYWQxDNfOWaGy7v8nwAAAAuk1AlUAANSbgAAAAIAAAADAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAAAAAAAAAAADAAAAAAADX2kAAAAAYzNYowAAAAAAAAACAAAAAwADX7QAAAABAAAAAF5Oned5cIcITCh+4L00my3wbJgphZDEM185ZobLu/yfAAAAAUFBQQAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAAAAAAAAAAAAAEqBfIAAAAAAQAAAAAAAAAAAAAAAQADX7QAAAABAAAAAF5Oned5cIcITCh+4L00my3wbJgphZDEM185ZobLu/yfAAAAAUFBQQAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAABKgXyAAAAAAEqBfIAAAAAAQAAAAAAAAAAAAAAAA==",
         fee_meta_xdr:
           "AAAAAgAAAAMAA19PAAAAAAAAAACen96whfs8vsAEF9HoTF0MO28X5Gmw3WKv3+Bu3CD4awAAABc6KL5UAAHcQwAAAB4AAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAAAAAAAAAAADAAAAAAADX08AAAAAYzNYFwAAAAAAAAABAANftAAAAAAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAAXOii9jAAB3EMAAAAeAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAwAAAAAAA19PAAAAAGMzWBcAAAAA",
         memo: nil,
         memo_type: "none",
         signatures: [
           "bzs8W5+NTYp9bNw9a4WPUe2f7AfEIf1xR6uV14uXmQLoQUrbMUO8KDf9y5Iy4nXVybCSikb/HJLbPAHNJ6uEBA==",
           "n8UWjvPs2bZcDlsVXA8iUkf+4aYPlIU8KdW9MDI/D1iHUVDUWZ7fup1fhu4IMJMdRxnWRM5nJaiLhjuP8lG+Aw=="
         ],
         valid_after: nil,
         valid_before: nil,
         preconditions: nil
       }
     }}
  end

  @impl true
  def create_trustline(_opts) do
    default_status = Enum.random([true, false])

    {:ok,
     %Mintacoin.Assets.Crypto.AssetResponse{
       successful: Application.get_env(:stellar_mock, :tx_status, default_status),
       tx_id: "22eb025e2281b2e35b2bd51bc5a3a102e8129b56dd1fc52145c0ce20dfcfe6c0",
       tx_hash: "22eb025e2281b2e35b2bd51bc5a3a102e8129b56dd1fc52145c0ce20dfcfe6c0",
       tx_timestamp: "2022-09-28 15:06:04Z",
       tx_response: %{
         created_at: ~U[2022-09-28 15:06:04Z],
         envelope_xdr:
           "AAAAAgAAAAApjxV21huhJI8dl8Fr7cxLOXoxqK6WU4rK65u1oETG+wAAAGQAA1//AAAABQAAAAAAAAAAAAAAAQAAAAAAAAAGAAAAAUFBQQAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+Gt//////////wAAAAAAAAABoETG+wAAAECd0J+1MxhOu9Pj0qJM7ndVUXYJr+NnL+B3nlOeL4eUeo85aqgtABIUrgS1cuHzyfaD8IcDGcL2BIQCFgrfIjoK",
         fee_charged: 100,
         fee_meta_xdr:
           "AAAAAgAAAAMAA5HfAAAAAAAAAAApjxV21huhJI8dl8Fr7cxLOXoxqK6WU4rK65u1oETG+wAAAAulbJ9wAANf/wAAAAQAAAADAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAAAAAAAAAAADAAAAAAADkd8AAAAAYzRhxgAAAAAAAAABAAOSFQAAAAAAAAAAKY8VdtYboSSPHZfBa+3MSzl6MaiullOKyuubtaBExvsAAAALpWyfDAADX/8AAAAEAAAAAwAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAwAAAAAAA5HfAAAAAGM0YcYAAAAA",
         hash: "22eb025e2281b2e35b2bd51bc5a3a102e8129b56dd1fc52145c0ce20dfcfe6c0",
         id: "22eb025e2281b2e35b2bd51bc5a3a102e8129b56dd1fc52145c0ce20dfcfe6c0",
         ledger: 234_005,
         max_fee: 100,
         memo: nil,
         memo_type: "none",
         operation_count: 1,
         paging_token: "1005043822104576",
         preconditions: nil,
         result_meta_xdr:
           "AAAAAgAAAAIAAAADAAOSFQAAAAAAAAAAKY8VdtYboSSPHZfBa+3MSzl6MaiullOKyuubtaBExvsAAAALpWyfDAADX/8AAAAEAAAAAwAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAwAAAAAAA5HfAAAAAGM0YcYAAAAAAAAAAQADkhUAAAAAAAAAACmPFXbWG6Ekjx2XwWvtzEs5ejGorpZTisrrm7WgRMb7AAAAC6VsnwwAA1//AAAABQAAAAMAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAAMAAAAAAAOSFQAAAABjNGLcAAAAAAAAAAEAAAACAAAAAwADkd8AAAABAAAAACmPFXbWG6Ekjx2XwWvtzEs5ejGorpZTisrrm7WgRMb7AAAAAUFBQQAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAAAdzWUAH//////////AAAAAQAAAAAAAAAAAAAAAQADkhUAAAABAAAAACmPFXbWG6Ekjx2XwWvtzEs5ejGorpZTisrrm7WgRMb7AAAAAUFBQQAAAAAAnp/esIX7PL7ABBfR6ExdDDtvF+RpsN1ir9/gbtwg+GsAAAAAdzWUAH//////////AAAAAQAAAAAAAAAAAAAAAA==",
         result_xdr: "AAAAAAAAAGQAAAAAAAAAAQAAAAAAAAAGAAAAAAAAAAA=",
         signatures: [
           "ndCftTMYTrvT49KiTO53VVF2Ca/jZy/gd55Tni+HlHqPOWqoLQASFK4EtXLh88n2g/CHAxnC9gSEAhYK3yI6Cg=="
         ],
         source_account: "GAUY6FLW2YN2CJEPDWL4C27NZRFTS6RRVCXJMU4KZLVZXNNAITDPXOEZ",
         source_account_sequence: 949_973_751_431_173,
         successful: true,
         valid_after: nil,
         valid_before: nil
       }
     }}
  end
end
