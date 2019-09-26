defmodule SehatHospital.Admin do
  @moduledoc """
  The Admin context.
  """

  import Ecto.Query, warn: false
  alias SehatHospital.Repo

  alias SehatHospital.Admin.Hospital

  @doc """
  Returns the list of hospitals.

  ## Examples

      iex> list_hospitals()
      [%Hospital{}, ...]

  """
  def list_hospitals do
    Repo.all(Hospital)
  end

  @doc """
  Gets a single hospital.

  Raises `Ecto.NoResultsError` if the Hospital does not exist.

  ## Examples

      iex> get_hospital!(123)
      %Hospital{}

      iex> get_hospital!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hospital!(id), do: Repo.get!(Hospital, id)

  @doc """
  Creates a hospital.

  ## Examples

      iex> create_hospital(%{field: value})
      {:ok, %Hospital{}}

      iex> create_hospital(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hospital(attrs \\ %{}) do
    %Hospital{}
    |> Hospital.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hospital.

  ## Examples

      iex> update_hospital(hospital, %{field: new_value})
      {:ok, %Hospital{}}

      iex> update_hospital(hospital, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hospital(%Hospital{} = hospital, attrs) do
    hospital
    |> Hospital.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Hospital.

  ## Examples

      iex> delete_hospital(hospital)
      {:ok, %Hospital{}}

      iex> delete_hospital(hospital)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hospital(%Hospital{} = hospital) do
    Repo.delete(hospital)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hospital changes.

  ## Examples

      iex> change_hospital(hospital)
      %Ecto.Changeset{source: %Hospital{}}

  """
  def change_hospital(%Hospital{} = hospital) do
    Hospital.changeset(hospital, %{})
  end

  alias SehatHospital.Admin.Doctor

  @doc """
  Returns the list of doctors.

  ## Examples

      iex> list_doctors()
      [%Doctor{}, ...]

  """
  def list_doctors do
    Doctor
    |> Repo.all()
    |> Repo.preload(:hospital)
  end

  @doc """
  Gets a single doctor.

  Raises `Ecto.NoResultsError` if the Doctor does not exist.

  ## Examples

      iex> get_doctor!(123)
      %Doctor{}

      iex> get_doctor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_doctor!(id) do
    Doctor
    |> Repo.get!(id)
    |> Repo.preload(:hospital)
  end

  @doc """
  Creates a doctor.

  ## Examples

      iex> create_doctor(%{field: value})
      {:ok, %Doctor{}}

      iex> create_doctor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_doctor(attrs \\ %{}) do
    %Doctor{}
    |> Doctor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a doctor.

  ## Examples

      iex> update_doctor(doctor, %{field: new_value})
      {:ok, %Doctor{}}

      iex> update_doctor(doctor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_doctor(%Doctor{} = doctor, attrs) do
    doctor
    |> Doctor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Doctor.

  ## Examples

      iex> delete_doctor(doctor)
      {:ok, %Doctor{}}

      iex> delete_doctor(doctor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_doctor(%Doctor{} = doctor) do
    Repo.delete(doctor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking doctor changes.

  ## Examples

      iex> change_doctor(doctor)
      %Ecto.Changeset{source: %Doctor{}}

  """
  def change_doctor(%Doctor{} = doctor) do
    Doctor.changeset(doctor, %{})
  end

  alias SehatHospital.Admin.Patient

  @doc """
  Returns the list of patients.

  ## Examples

      iex> list_patients()
      [%Patient{}, ...]

  """
  def list_patients do
    Repo.all(Patient)
  end

  @doc """
  Gets a single patient.

  Raises `Ecto.NoResultsError` if the Patient does not exist.

  ## Examples

      iex> get_patient!(123)
      %Patient{}

      iex> get_patient!(456)
      ** (Ecto.NoResultsError)

  """
  def get_patient!(id), do: Repo.get!(Patient, id)

  @doc """
  Creates a patient.

  ## Examples

      iex> create_patient(%{field: value})
      {:ok, %Patient{}}

      iex> create_patient(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_patient(attrs \\ %{}) do
    %Patient{}
    |> Patient.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a patient.

  ## Examples

      iex> update_patient(patient, %{field: new_value})
      {:ok, %Patient{}}

      iex> update_patient(patient, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_patient(%Patient{} = patient, attrs) do
    patient
    |> Patient.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Patient.

  ## Examples

      iex> delete_patient(patient)
      {:ok, %Patient{}}

      iex> delete_patient(patient)
      {:error, %Ecto.Changeset{}}

  """
  def delete_patient(%Patient{} = patient) do
    Repo.delete(patient)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking patient changes.

  ## Examples

      iex> change_patient(patient)
      %Ecto.Changeset{source: %Patient{}}

  """
  def change_patient(%Patient{} = patient) do
    Patient.changeset(patient, %{})
  end
end
