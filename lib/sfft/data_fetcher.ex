defmodule SFFT.DataFetcher do
  use GenServer

  alias DateTime, as: DT

  @refresh_time ~T[08:00:00]

  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end

  @impl true
  def init(state) do
    Process.send_after(self(), :fetch_data, 0)
    {:ok, state}
  end

  @impl true
  def handle_info(:fetch_data, state) do
    fetch_data()
    {:noreply, state}
  end

  def fetch_data() do
    SFFT.fetch_permit_data()
    SFFT.fetch_schedule_data()

    tomorrow =
      DT.now!("America/Los_Angeles")
      |> DT.add(1, :day)
      |> then(&(&1 |> DT.to_date() |> DT.new!(@refresh_time, "America/Los_Angeles")))

    Process.send_after(
      self(),
      :fetch_data,
      DT.diff(tomorrow, DateTime.utc_now(), :millisecond)
    )
  end
end
