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
end
