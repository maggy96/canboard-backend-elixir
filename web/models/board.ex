defmodule Canboard.Board do
  use Canboard.Web, :model

  schema "boards" do
    field :title, :string
    field :description, :string
    belongs_to :user, Canboard.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description])
    |> validate_required([:title, :description])
  end
end
