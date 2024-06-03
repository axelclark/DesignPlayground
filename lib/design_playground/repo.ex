defmodule DesignPlayground.Repo do
  use Ecto.Repo,
    otp_app: :design_playground,
    adapter: Ecto.Adapters.Postgres
end
