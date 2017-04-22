# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :canboard,
  ecto_repos: [Canboard.Repo]

# Configures the endpoint
config :canboard, Canboard.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s69qYkQ1tjRh+bZOmOeuV8tosoAwiatUZeNxYxlGTwc2a85pXbwV5SONJ+Fi8blS",
  render_errors: [view: Canboard.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Canboard.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  binary_id: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


api_actions = [:create, :show, :update, :delete]
# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Canboard.User,
  repo: Canboard.Repo,
  module: Canboard,
  logged_out_url: "/",
  email_from_name: "Canboard",
  email_from_email: "users@canboard.com",
  opts: [authenticatable: api_actions,
         recoverable: api_actions,
         trackable: api_actions,
         unlockable_with_token: api_actions,
         lockable: api_actions,
         confirmable: api_actions,
         registerable: api_actions,]

config :coherence, Canboard.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
