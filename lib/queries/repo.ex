defmodule Queries.Repo do
  use Ecto.Repo,
    otp_app: :queries,
    adapter: Ecto.Adapters.Postgres
end
