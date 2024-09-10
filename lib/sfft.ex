defmodule SFFT do
  @moduledoc """
  SFFT keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  require Logger

  @doc """
  Fetch Permit Data
  """
  def fetch_permit_data() do
    Logger.info("Fetching Permit Data")
  end

  @doc """
  Fetch Schedule Data
  """
  def fetch_schedule_data() do
    Logger.info("Fetching Schedule Data")
  end
end
