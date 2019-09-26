defmodule SehatHospitalWeb.Admin.PatientController do
  use SehatHospitalWeb, :controller

  alias SehatHospital.Admin
  alias SehatHospital.Admin.Patient

  def index(conn, _params) do
    patients = Admin.list_patients()
    render(conn, "index.html", patients: patients)
  end

  def new(conn, _params) do
    changeset = Admin.change_patient(%Patient{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"patient" => patient_params}) do
    case Admin.create_patient(patient_params) do
      {:ok, patient} ->
        conn
        |> put_flash(:info, "Patient created successfully.")
        |> redirect(to: Routes.patient_path(conn, :show, patient))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    patient = Admin.get_patient!(id)
    render(conn, "show.html", patient: patient)
  end

  def edit(conn, %{"id" => id}) do
    patient = Admin.get_patient!(id)
    changeset = Admin.change_patient(patient)
    render(conn, "edit.html", patient: patient, changeset: changeset)
  end

  def update(conn, %{"id" => id, "patient" => patient_params}) do
    patient = Admin.get_patient!(id)

    case Admin.update_patient(patient, patient_params) do
      {:ok, patient} ->
        conn
        |> put_flash(:info, "Patient updated successfully.")
        |> redirect(to: Routes.patient_path(conn, :show, patient))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", patient: patient, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    patient = Admin.get_patient!(id)
    {:ok, _patient} = Admin.delete_patient(patient)

    conn
    |> put_flash(:info, "Patient deleted successfully.")
    |> redirect(to: Routes.patient_path(conn, :index))
  end
end
