defmodule Canboard.PageController do
  use Canboard.Web, :controller

  def index(conn) do
    index(conn, %{})
  end

  def index(conn, _params) do
    conn
    |> put_layout(false)
    |> render "index.html"
  end
end
