defmodule Wheelie.Repo.Migrations.CreateCity do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :city_id, :integer
      add :city, :string
      add :prefix, :string
      add :state_id, :integer
      add :country_id, :integer

      timestamps
    end

  end
end
