defmodule SehatHospital.Admin.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :age, :integer
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:email, :password, :name, :age])
    |> validate_required([:email, :password, :name, :age])
    |> hash_password()
  end

  defp hash_password(%Ecto.Changeset{valid?: true,
                                     changes: %{password: password}} = changeset) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp hash_password(changeset), do: changeset
end
