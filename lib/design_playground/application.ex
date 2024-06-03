defmodule DesignPlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DesignPlaygroundWeb.Telemetry,
      DesignPlayground.Repo,
      {DNSCluster, query: Application.get_env(:design_playground, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DesignPlayground.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: DesignPlayground.Finch},
      # Start a worker by calling: DesignPlayground.Worker.start_link(arg)
      # {DesignPlayground.Worker, arg},
      # Start to serve requests, typically the last entry
      DesignPlaygroundWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DesignPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DesignPlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
