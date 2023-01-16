defmodule QueriesWeb.PageController do
  use QueriesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
