defmodule OpencocktailBackend.Repo.Migrations.CreateCocktails do
  use Ecto.Migration

  def change do
    create table(:cocktails) do

      timestamps()
    end

  end
end
