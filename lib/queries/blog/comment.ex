defmodule Queries.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blog_comments" do
    field :content, :string
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
