defmodule Canboard.BoardTest do
  use Canboard.ModelCase

  alias Canboard.Board

  @valid_attrs %{description: "Sample board description", title: "Sample title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Board.changeset(%Board{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Board.changeset(%Board{}, @invalid_attrs)
    refute changeset.valid?
  end
end
