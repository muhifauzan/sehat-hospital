defmodule SehatHospital.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :name, :string
      add :age, :smallint

      timestamps(type: :utc_datetime)
    end
  end
end
