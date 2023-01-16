defmodule Queries.Repo.Migrations.CreateBlogPosts do
  use Ecto.Migration

  def change do
    create table(:blog_posts) do
      add :content, :text
      add :user_id, references(:accounts_users, on_delete: :nothing)

      timestamps()
    end

    create index(:blog_posts, [:user_id])
  end
end
