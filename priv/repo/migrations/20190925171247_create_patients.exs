defmodule SehatHospital.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :email, :string, null: false
      add :password_hash, :string
      add :name, :string
      add :age, :smallint

      timestamps(type: :utc_datetime)
    end

    create unique_index(:patients, [:email])
  end
end
