defmodule SFFT.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :day, :string, null: false
      add :open, :string, null: false
      add :close, :string, null: false

      add :location_id, references(:permits, column: :location_id), null: false
    end

    create unique_index(:schedules, [:location_id, :day, :open])
  end
end
