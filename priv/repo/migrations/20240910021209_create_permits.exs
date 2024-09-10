defmodule SFFT.Repo.Migrations.CreatePermits do
  use Ecto.Migration

  def change do
    create table(:permits) do
      add :location_id, :integer, null: false
      add :name, :string, null: false
      add :type, :string, null: false
    end

    create unique_index(:permits, [:location_id])
  end
end
