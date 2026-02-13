defmodule CvApp.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CvAppWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:cv_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CvApp.PubSub},
      CvAppWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: CvApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    CvAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
