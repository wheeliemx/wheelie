defmodule Wheelie.Repo.Migrations.CreateModel do
  use Ecto.Migration

  def change do
    create table(:models) do
      add :model_id, :integer
      add :model, :string
      add :brand_id, :integer

      timestamps
    end

  end
end
