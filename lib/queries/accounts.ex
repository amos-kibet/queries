defmodule Queries.Accounts do
  alias Queries.Repo
  alias Queries.Accounts.UserQueries

  def list_users do
    UserQueries.all()
    |> Repo.all()
  end

  def list_users_having_posts do
    UserQueries.with_existing_posts()
    |> Repo.all()
  end

  def list_users_having_posts_with_comments do
    UserQueries.with_existing_comments()
    |> Repo.all()
  end

  def find_user_by_id(user_id) do
    UserQueries.with_id(user_id)
    |> Repo.all()
  end

  def user_has_posts?(user_id) do
    UserQueries.with_id(user_id)
    |> UserQueries.with_existing_posts()
    |> Repo.exists?()
  end
end
