defmodule SehatHospital.Repo do
  use Ecto.Repo,
    otp_app: :sehat_hospital,
    adapter: Ecto.Adapters.Postgres
end
