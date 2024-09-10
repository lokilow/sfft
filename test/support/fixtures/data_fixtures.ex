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
end
