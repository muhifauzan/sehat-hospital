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

  describe "doctors" do
    alias SehatHospital.Admin.Doctor

    @valid_attrs %{age: 42, focus: "some focus", name: "some name", schedule: "14:00:00"}
    @update_attrs %{age: 43, focus: "some updated focus", name: "some updated name", schedule: "15:01:01"}
    @invalid_attrs %{age: nil, focus: nil, name: nil, schedule: nil}

    def doctor_fixture(attrs \\ %{}) do
      hospital = hospital_fixture()
      {:ok, doctor} =
        attrs
        |> Map.merge(%{hospital_id: hospital.id})
        |> Enum.into(@valid_attrs)
        |> Admin.create_doctor()

      doctor
    end

    test "list_doctors/0 returns all doctors" do
      doctor = doctor_fixture()
      assert Admin.list_doctors() == [doctor]
    end

    test "get_doctor!/1 returns the doctor with given id" do
      doctor = doctor_fixture()
      assert Admin.get_doctor!(doctor.id) == doctor
    end

    test "create_doctor/1 with valid data creates a doctor" do
      hospital = hospital_fixture()
      assert {:ok, %Doctor{} = doctor} =
        @valid_attrs
        |> Map.merge(%{hospital_id: hospital.id})
        |> Admin.create_doctor()
      assert doctor.age == 42
      assert doctor.focus == "some focus"
      assert doctor.name == "some name"
      assert doctor.schedule == Time.from_iso8601!("14:00:00")
    end

    test "create_doctor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_doctor(@invalid_attrs)
    end

    test "update_doctor/2 with valid data updates the doctor" do
      doctor = doctor_fixture()
      assert {:ok, %Doctor{} = doctor} = Admin.update_doctor(doctor, @update_attrs)
      assert doctor.age == 43
      assert doctor.focus == "some updated focus"
      assert doctor.name == "some updated name"
      assert doctor.schedule == Time.from_iso8601!("15:01:01")
    end

    test "update_doctor/2 with invalid data returns error changeset" do
      doctor = doctor_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_doctor(doctor, @invalid_attrs)
      assert doctor == Admin.get_doctor!(doctor.id)
    end

    test "delete_doctor/1 deletes the doctor" do
      doctor = doctor_fixture()
      assert {:ok, %Doctor{}} = Admin.delete_doctor(doctor)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_doctor!(doctor.id) end
    end

    test "change_doctor/1 returns a doctor changeset" do
      doctor = doctor_fixture()
      assert %Ecto.Changeset{} = Admin.change_doctor(doctor)
    end
  end

  describe "patients" do
    alias SehatHospital.Admin.Patient

    @valid_attrs %{age: 42, email: "some email", name: "some name", password: "some password"}
    @update_attrs %{age: 43, email: "some updated email", name: "some updated name", password: "some updated password"}
    @invalid_attrs %{age: nil, email: nil, name: nil, password_hash: nil}

    def patient_fixture(attrs \\ %{}) do
      {:ok, patient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_patient()

      patient
    end

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Admin.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Admin.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      assert {:ok, %Patient{} = patient} = Admin.create_patient(@valid_attrs)
      assert patient.age == 42
      assert patient.email == "some email"
      assert patient.name == "some name"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{} = patient} = Admin.update_patient(patient, @update_attrs)
      assert patient.age == 43
      assert patient.email == "some updated email"
      assert patient.name == "some updated name"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_patient(patient, @invalid_attrs)
      assert patient == Admin.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Admin.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Admin.change_patient(patient)
    end
  end
end
