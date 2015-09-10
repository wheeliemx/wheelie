defmodule Wheelie.Repo.Migrations.CreateCountry do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :country_id, :integer
      add :country, :string

      timestamps
    end

  end
end
