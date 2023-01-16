defmodule Queries.Accounts.UserQueries do
  import Ecto.Query

  alias Queries.Accounts.User

  def all(), do: User

  def with_id(id) do
    User
    |> where([user], user.id == ^id)
  end

  def with_existing_posts() do
    User
    |> join(:left, [user], _ in assoc(user, :posts))
    |> where([_, posts], not is_nil(posts.id))
  end
end
