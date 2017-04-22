defmodule Canboard.User do
  use Canboard.Web, :model
  use Coherence.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    has_many :boards, Canboard.Board
    coherence_schema

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email] ++ coherence_fields)
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end
end
