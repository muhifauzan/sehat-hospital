use Mix.Config

# Configure your database
config :sehat_hospital, SehatHospital.Repo,
  username: "postgres",
  password: "postgres",
  database: "sehat_hospital_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sehat_hospital, SehatHospitalWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
