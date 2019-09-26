defmodule SehatHospital.Admin.Doctor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "doctors" do
    belongs_to :hospital, SehatHospital.Admin.Hospital

    field :age, :integer
    field :focus, :string
    field :name, :string
    field :schedule, :time

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(doctor, attrs) do
    doctor
    |> cast(attrs, [:hospital_id, :name, :age, :focus, :schedule])
    |> foreign_key_constraint(:hospital_id)
    |> validate_required([:name, :age, :focus, :schedule])
  end
end
