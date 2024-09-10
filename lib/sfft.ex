defmodule SFFT do
  @moduledoc """
  SFFT keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias SFFT.{Data.Permit, Data.Schedule, Repo}
  require Logger

  @permit_url "https://data.sfgov.org/resource/rqzj-sfat.csv"
  @schedule_url "https://data.sfgov.org/resource/jjew-r69b.csv"

  @doc """
  Fetch Permit Data
  """
  def fetch_permit_data() do
    Logger.info("Fetching Permits")

    case Req.get!(@permit_url) do
      %{status: 200, body: csv} ->
        [columns | data] = csv
        Logger.debug("permit columns: #{inspect(columns)}")

        data
        |> Enum.map(fn row ->
          [location_id, name, type | _] = row
          %{location_id: String.to_integer(location_id), name: name, type: type}
        end)
        |> then(&Repo.insert_all(Permit, &1, on_conflict: :replace_all))

      %{status: status} ->
        Logger.error("Error downloading permit data. status=#{status}")
    end
  end

  @doc """
  Fetch Schedule Data
  """
  def fetch_schedule_data() do
    Logger.info("Fetching Schedules")

    case Req.get!(@schedule_url) do
      %{status: 200, body: csv} ->
        [columns | data] = csv
        Logger.debug("schedule columns: #{inspect(columns)}")

        data
        |> Enum.map(fn row ->
          [_, day, open, close, _, _, _, _, location_id | _] = row
          %{day: day, open: open, close: close, location_id: String.to_integer(location_id)}
        end)
        |> then(&Repo.insert_all(Schedule, &1, on_conflict: :replace_all))

      %{status: status} ->
        Logger.error("Error downloading schedule data. status=#{status}")
    end
  end
end
