defmodule Wheelie.Repo.Migrations.CreateLicense do
  use Ecto.Migration

  def change do
    create table(:licenses) do
      add :license_id, :integer
      add :license, :string

      timestamps
    end

  end
end
