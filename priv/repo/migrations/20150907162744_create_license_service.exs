defmodule Wheelie.Repo.Migrations.CreateLicenseService do
  use Ecto.Migration

  def change do
    create table(:license_services) do
      add :license_service_id, :integer
      add :service_id, :integer
      add :license_id, :integer

      timestamps
    end

  end
end
