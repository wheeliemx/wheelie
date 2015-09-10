defmodule Wheelie.Repo.Migrations.CreateService do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :service_id, :integer
      add :service, :string

      timestamps
    end

  end
end
