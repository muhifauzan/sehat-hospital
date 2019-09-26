defmodule SehatHospitalWeb.Admin.DoctorView do
  use SehatHospitalWeb, :view

  def hospital_name(doctor) do
    doctor.hospital.name
  end
end
