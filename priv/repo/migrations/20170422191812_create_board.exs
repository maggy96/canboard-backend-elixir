defmodule Canboard.Repo.Migrations.CreateBoard do
  use Ecto.Migration

  def change do
    create table(:boards, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :description, :text
      add :user_id, references(:users, type: :uuid)

      timestamps()
    end

  end
end
