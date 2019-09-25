defmodule SehatHospital.AdminTest do
  use SehatHospital.DataCase

  alias SehatHospital.Admin

  describe "hospitals" do
    alias SehatHospital.Admin.Hospital

    @valid_attrs %{address: "some address", name: "some name"}
    @update_attrs %{address: "some updated address", name: "some updated name"}
    @invalid_attrs %{address: nil, name: nil}

    def hospital_fixture(attrs \\ %{}) do
      {:ok, hospital} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_hospital()

      hospital
    end

    test "list_hospitals/0 returns all hospitals" do
      hospital = hospital_fixture()
      assert Admin.list_hospitals() == [hospital]
    end

    test "get_hospital!/1 returns the hospital with given id" do
      hospital = hospital_fixture()
      assert Admin.get_hospital!(hospital.id) == hospital
    end

    test "create_hospital/1 with valid data creates a hospital" do
      assert {:ok, %Hospital{} = hospital} = Admin.create_hospital(@valid_attrs)
      assert hospital.address == "some address"
      assert hospital.name == "some name"
    end

    test "create_hospital/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_hospital(@invalid_attrs)
    end

    test "update_hospital/2 with valid data updates the hospital" do
      hospital = hospital_fixture()
      assert {:ok, %Hospital{} = hospital} = Admin.update_hospital(hospital, @update_attrs)
      assert hospital.address == "some updated address"
      assert hospital.name == "some updated name"
    end

    test "update_hospital/2 with invalid data returns error changeset" do
      hospital = hospital_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_hospital(hospital, @invalid_attrs)
      assert hospital == Admin.get_hospital!(hospital.id)
    end

    test "delete_hospital/1 deletes the hospital" do
      hospital = hospital_fixture()
      assert {:ok, %Hospital{}} = Admin.delete_hospital(hospital)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_hospital!(hospital.id) end
    end

    test "change_hospital/1 returns a hospital changeset" do
      hospital = hospital_fixture()
      assert %Ecto.Changeset{} = Admin.change_hospital(hospital)
    end
  end
end
