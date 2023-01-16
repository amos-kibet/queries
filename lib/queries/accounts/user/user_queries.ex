defmodule Queries.Accounts.UserQueries do
  import Ecto.Query

  alias Queries.Accounts.User

  def all(query \\ base()), do: query

  def with_id(query \\ base(), id) do
    query
    |> where([user], user.id == ^id)
  end

  def with_existing_posts(query \\ base()) do
    query
    |> join(:left, [user], _ in assoc(user, :posts))
    |> where([_, posts], not is_nil(posts.id))
  end

  defp base, do: User
end
