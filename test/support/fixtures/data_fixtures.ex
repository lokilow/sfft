defmodule SFFT.DataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SFFT.Data` context.
  """

  @doc """
  Generate a permit.
  """
  def permit_fixture(attrs \\ %{}) do
    {:ok, permit} =
      attrs
      |> Enum.into(%{
        location_id: 42,
        name: "some name",
        type: "some type"
      })
      |> SFFT.Data.create_permit()

    permit
  end

  @doc """
  Generate a schedules.
  """
  def schedules_fixture(attrs \\ %{}) do
    {:ok, schedules} =
      attrs
      |> Enum.into(%{
        close: "some close",
        day: "some day",
        location_id: 42,
        open: "some open"
      })
      |> SFFT.Data.create_schedules()

    schedules
  end
end
