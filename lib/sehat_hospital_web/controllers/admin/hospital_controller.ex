defmodule SehatHospitalWeb.Admin.HospitalController do
  use SehatHospitalWeb, :controller

  alias SehatHospital.Admin
  alias SehatHospital.Admin.Hospital

  def index(conn, _params) do
    hospitals = Admin.list_hospitals()
    render(conn, "index.html", hospitals: hospitals)
  end

  def new(conn, _params) do
    changeset = Admin.change_hospital(%Hospital{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hospital" => hospital_params}) do
    case Admin.create_hospital(hospital_params) do
      {:ok, hospital} ->
        conn
        |> put_flash(:info, "Hospital created successfully.")
        |> redirect(to: Routes.hospital_path(conn, :show, hospital))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hospital = Admin.get_hospital!(id)
    render(conn, "show.html", hospital: hospital)
  end

  def edit(conn, %{"id" => id}) do
    hospital = Admin.get_hospital!(id)
    changeset = Admin.change_hospital(hospital)
    render(conn, "edit.html", hospital: hospital, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hospital" => hospital_params}) do
    hospital = Admin.get_hospital!(id)

    case Admin.update_hospital(hospital, hospital_params) do
      {:ok, hospital} ->
        conn
        |> put_flash(:info, "Hospital updated successfully.")
        |> redirect(to: Routes.hospital_path(conn, :show, hospital))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", hospital: hospital, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hospital = Admin.get_hospital!(id)
    {:ok, _hospital} = Admin.delete_hospital(hospital)

    conn
    |> put_flash(:info, "Hospital deleted successfully.")
    |> redirect(to: Routes.hospital_path(conn, :index))
  end
end
