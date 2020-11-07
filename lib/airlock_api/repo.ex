defmodule AirlockApi.Repo do
  use Ecto.Repo,
    otp_app: :airlock_api,
    adapter: Ecto.Adapters.Postgres
end
