# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :notification_api,
  ecto_repos: [NotificationApi.Repo]

# Configures the endpoint
config :notification_api, NotificationApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v9aZRVvaTNNFx5SrJvnmU3GaUHI/ck2/rwzuRzfqIuDnCbHBrLHx5xlU8yWYwMfv",
  render_errors: [view: NotificationApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: NotificationApi.PubSub,
  live_view: [signing_salt: "BW4IrRIY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
