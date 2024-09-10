defmodule SFFT.Data.Permit do
  @moduledoc """
  The Permit Ecto Schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "permits" do
    field :name, :string
    field :type, :string
    field :location_id, :integer

    has_many :schedules, SFFT.Data.Schedule, references: :location_id, foreign_key: :location_id
  end

  @doc false
  def changeset(permit, attrs) do
    permit
    |> cast(attrs, [:location_id, :name, :type])
    |> validate_required([:location_id, :name, :type])
  end
end
