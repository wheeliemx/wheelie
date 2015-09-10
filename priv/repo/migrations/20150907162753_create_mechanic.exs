defmodule Wheelie.Repo.Migrations.CreateMechanic do
  use Ecto.Migration

  def change do
    create table(:mechanics) do
      add :mechanic_id, :integer
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :license_id, :integer

      timestamps
    end

  end
end
