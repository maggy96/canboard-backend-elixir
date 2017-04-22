defmodule Canboard.PageController do
  use Canboard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
