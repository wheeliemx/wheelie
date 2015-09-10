defmodule Wheelie.Repo.Migrations.CreateLegalAddress do
  use Ecto.Migration

  def change do
    create table(:legal_adresses) do
      add :legal_address_id, :integer
      add :street, :string
      add :external_number, :string
      add :internal_number, :string
      add :neighborhood, :string
      add :locality, :string
      add :zip_code, :string
      add :city_id, :integer
      add :state_id, :integer
      add :country_id, :integer

      timestamps
    end

  end
end
