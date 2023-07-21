defmodule AttemptNavBar.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AttemptNavBarWeb.Telemetry,
      # Start the Ecto repository
      AttemptNavBar.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: AttemptNavBar.PubSub},
      # Start Finch
      {Finch, name: AttemptNavBar.Finch},
      # Start the Endpoint (http/https)
      AttemptNavBarWeb.Endpoint
      # Start a worker by calling: AttemptNavBar.Worker.start_link(arg)
      # {AttemptNavBar.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AttemptNavBar.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AttemptNavBarWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
