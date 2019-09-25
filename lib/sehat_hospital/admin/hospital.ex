defmodule SehatHospital.Admin.Hospital do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hospitals" do
    field :address, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(hospital, attrs) do
    hospital
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
