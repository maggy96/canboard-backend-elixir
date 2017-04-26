defmodule Canboard.PageControllerTest do
  use Canboard.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "frontend"
  end
end
