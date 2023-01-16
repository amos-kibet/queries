defmodule Queries.Accounts.UserQueries do
  import Ecto.Query

  alias Queries.Accounts.User

  def all(query \\ base()), do: query

  def with_id(query \\ base(), id) do
    query
    |> where([user: user], user.id == ^id)
  end

  def with_existing_posts(query \\ base()) do
    query
    |> with_join(:posts)
    |> where([posts: posts], not is_nil(posts.id))
  end

  def with_existing_comments(query \\ base()) do
    query
    |> with_join(:comments)
    |> where([comments: comments], not is_nil(comments.id))
  end

  defp with_join(query, :posts) do
    if has_named_binding?(query, :posts) do
      query
    else
      query
      |> join(:left, [user: user], _ in assoc(user, :posts), as: :posts)
    end
  end

  defp with_join(query, :comments) do
    if has_named_binding?(query, :comments) do
      query
    else
      query
      |> with_join(:posts)
      |> join(:left, [posts: posts], _ in assoc(posts, :comments), as: :comments)
    end
  end

  defp base do
    from(_ in User, as: :user)
  end
end
