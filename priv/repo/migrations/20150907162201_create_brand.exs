defmodule Wheelie.Repo.Migrations.CreateBrand do
  use Ecto.Migration

  def change do
    create table(:brands) do
      add :brand_id, :integer
      add :brand, :string

      timestamps
    end

  end
end
