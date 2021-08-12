defmodule Wabanex.Repo.Migrations.CreateExercisesTable do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :name, :string
      add :description, :string
      add :repetition, :string
      add :video_url, :string
      add :training_id, references(:trainings)
      timestamps()
    end
  end
end
