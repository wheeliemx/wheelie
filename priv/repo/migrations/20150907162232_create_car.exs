defmodule Wheelie.Repo.Migrations.CreateCar do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :car_id, :integer
      add :year, :string
      add :alternative_brand_name, :string
      add :alternative_model_name, :string
      add :description, :string
      add :user_id, :integer
      add :model_id, :integer
      add :brand_id, :integer

      timestamps
    end

  end
end
