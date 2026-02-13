import Config

config :cv_app, CvAppWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: false,
  server: true,
  secret_key_base: System.get_env("SECRET_KEY_BASE") || "prod_secret_key_base_change_this"

config :logger, level: :info
