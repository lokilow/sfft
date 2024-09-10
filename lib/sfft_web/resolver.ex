defmodule SFFTWeb.Resolver do
  @moduledoc """
  GraphQL Resolvers
  """
  alias SFFT.Data

  def all_permits(_root, _args, _info) do
    {:ok, Data.list_permits()}
  end

  def all_schedules(_root, _args, _info) do
    {:ok, Data.list_schedules()}
  end
end
