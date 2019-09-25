# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sehat_hospital,
  ecto_repos: [SehatHospital.Repo]

# Configures the endpoint
config :sehat_hospital, SehatHospitalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2xKe6f1xOUVHeTMIEQJiql+nDXS0Gi9lGalRIIZdTxuSckOUGMzW8PlR5mz3jLp9",
  render_errors: [view: SehatHospitalWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SehatHospital.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
