defmodule SFFT.Repo do
  use Ecto.Repo,
    otp_app: :sfft,
    adapter: Ecto.Adapters.SQLite3
end
