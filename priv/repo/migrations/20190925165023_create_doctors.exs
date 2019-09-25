defmodule SehatHospital.Repo.Migrations.CreateDoctors do
  use Ecto.Migration

  def change do
    create table(:doctors) do
      add :name, :string
      add :age, :smallint
      add :focus, :string
      add :schedule, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
