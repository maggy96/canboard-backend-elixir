defmodule Canboard.BoardView do
  use Canboard.Web, :view
  use Canboard.Api, :view

  def render("index.json", %{boards: boards}) do
    %{ "boards" => render_many(boards, Canboard.BoardView, "board.json") }
  end

  def render("show.json", %{board: board}) do
    %{ "board" => render_one(board, Canboard.BoardView, "board.json") }
  end

  def render("board.json", %{board: board}) do
    %{ id: board.id,
       title: board.title,
       description: board.description }
  end
end
