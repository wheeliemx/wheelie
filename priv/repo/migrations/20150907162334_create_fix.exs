defmodule Wheelie.Repo.Migrations.CreateFix do
  use Ecto.Migration

  def change do
    create table(:fixes) do
      add :fix_id, :integer
      add :fix, :string
      add :service_id, :integer
      add :mechanic_id, :integer
      add :car_id, :integer
      add :user_id, :integer

      timestamps
    end

  end
end
