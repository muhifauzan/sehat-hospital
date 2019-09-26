defmodule SehatHospital.Repo.Migrations.CreateDoctors do
  use Ecto.Migration

  def change do
    create table(:doctors) do
      add :hospital_id, references(:hospitals)
      add :name, :string
      add :age, :smallint
      add :focus, :string
      add :schedule, :time

      timestamps(type: :utc_datetime)
    end
  end
end
