defmodule Queries.Accounts do
  alias Queries.Accounts.UserQueries
  alias Queries.Repo

  def list_users do
    UserQueries.all()
    |> Repo.all()
  end

  def list_users_having_posts do
    UserQueries.with_existing_posts()
    |> Repo.all()
  end

  def find_user_by_id(user_id) do
    UserQueries.with_id(user_id)
    |> Repo.one()
  end

  def user_has_posts?(user_id) do
    UserQueries.with_existing_posts()
    # now what?
  end
end
