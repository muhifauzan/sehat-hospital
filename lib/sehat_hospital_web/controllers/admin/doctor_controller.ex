defmodule SehatHospitalWeb.Admin.DoctorController do
  use SehatHospitalWeb, :controller

  alias SehatHospital.Admin
  alias SehatHospital.Admin.Doctor

  def index(conn, _params) do
    doctors = Admin.list_doctors()
    render(conn, "index.html", doctors: doctors)
  end

  def new(conn, _params) do
    changeset = Admin.change_doctor(%Doctor{})
    hospitals = SehatHospital.Admin.list_hospitals()
    render(conn, "new.html", changeset: changeset, hospitals: hospitals)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    case Admin.create_doctor(doctor_params) do
      {:ok, doctor} ->
        conn
        |> put_flash(:info, "Doctor created successfully.")
        |> redirect(to: Routes.doctor_path(conn, :show, doctor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor = Admin.get_doctor!(id)
    render(conn, "show.html", doctor: doctor)
  end

  def edit(conn, %{"id" => id}) do
    doctor = Admin.get_doctor!(id)
    changeset = Admin.change_doctor(doctor)
    hospitals = SehatHospital.Admin.list_hospitals()
    render(conn, "edit.html", doctor: doctor, changeset: changeset, hospitals: hospitals)
  end

  def update(conn, %{"id" => id, "doctor" => doctor_params}) do
    doctor = Admin.get_doctor!(id)

    case Admin.update_doctor(doctor, doctor_params) do
      {:ok, doctor} ->
        conn
        |> put_flash(:info, "Doctor updated successfully.")
        |> redirect(to: Routes.doctor_path(conn, :show, doctor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", doctor: doctor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor = Admin.get_doctor!(id)
    {:ok, _doctor} = Admin.delete_doctor(doctor)

    conn
    |> put_flash(:info, "Doctor deleted successfully.")
    |> redirect(to: Routes.doctor_path(conn, :index))
  end
end
