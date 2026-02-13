defmodule CvAppWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :cv_app

  @session_options [
    store: :cookie,
    key: "_cv_app_key",
    signing_salt: "random_salt",
    same_site: "Lax"
  ]

  plug Plug.Static,
    at: "/",
    from: :cv_app,
    gzip: false,
    only: CvAppWeb.static_paths()

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug CvAppWeb.Router
end
