defmodule SehatHospital.Repo.Migrations.CreateHospitals do
  use Ecto.Migration

  def change do
    create table(:hospitals) do
      add :name, :string
      add :address, :string

      timestamps(type: :utc_datetime)
    end
  end
end
