defmodule SehatHospital.Repo.Migrations.CreateAppointments do
  use Ecto.Migration

  def change do
    create table(:appointments, primary_key: false) do
      add :doctor_id, references(:doctors)
      add :patient_id, references(:patients)
      add :schedule, :utc_datetime
    end
  end
end
