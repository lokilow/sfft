defmodule SFFT.Data.Schedule do
  @moduledoc """
  The Schedule Ecto Schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedules" do
    field :day, :string
    field :open, :string
    field :close, :string

    belongs_to :permit, SFFT.Data.Permit, foreign_key: :location_id
  end

  @doc false
  def changeset(schedules, attrs) do
    schedules
    |> cast(attrs, [:day, :open, :close, :location_id])
    |> validate_required([:day, :open, :close, :location_id])
    |> assoc_constraint(:permit)
  end
end
