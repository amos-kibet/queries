defmodule Queries.Repo.Migrations.CreateAccountsUsers do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :email, :string

      timestamps()
    end
  end
end
