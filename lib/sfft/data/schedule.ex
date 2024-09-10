defmodule SFFT.Data.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedules" do
    field :close, :string
    field :open, :string
    field :day, :string

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
