use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :canboard, Canboard.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []


# Watch static and templates for browser reloading.
config :canboard, Canboard.Endpoint,
  live_reload: [
    patterns: [
      # ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :canboard, Canboard.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "canboard",
  password: "canboard",
  database: "canboard",
  hostname: "localhost",
  pool_size: 10

# Watches files from the frontend and copies them to the backend path
config :eye_drops,
  tasks: [
    %{
      id: :frontend_js,
      name: "Frontend Assets",
      run_on_start: true,
      cmd: "cp -r canboard-frontend/resources/public/* priv/static/ && cp -r canboard-frontend/target/cljsbuild/public/* priv/static/",
      paths: ["canboard-frontend/resources/public",
              "canboard-frontend/target/cljsbuild/public"]
    }
  ]
