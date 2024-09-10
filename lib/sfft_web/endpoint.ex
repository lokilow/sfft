defmodule SFFTWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :sfft

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Absinthe.Plug.GraphiQL, schema: SFFTWeb.Schema
end
