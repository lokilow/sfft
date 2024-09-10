defmodule SFFTWeb.Schema do
  @moduledoc """
  The GraphQL Schema defintion

  Since this is a simple API, also define types directly in this module
  """
  use Absinthe.Schema

  alias SFFTWeb.Resolver

  object :permit do
    field :name, non_null(:string)
    field :type, non_null(:string)
    field :location_id, non_null(:id)

    field :schedules, list_of(:schedule)
  end

  object :schedule do
    field :day, non_null(:string)
    field :open, non_null(:string)
    field :close, non_null(:string)
    field :location_id, non_null(:integer)
  end

  query do
    @desc "Get all permits"
    field :all_permits, list_of(:permit) do
      resolve(&Resolver.all_permits/3)
    end

    @desc "Get all schedules"
    field :all_schedules, list_of(:schedule) do
      resolve(&Resolver.all_schedules/3)
    end
  end
end
