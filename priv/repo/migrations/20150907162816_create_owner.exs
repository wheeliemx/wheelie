defmodule Wheelie.Repo.Migrations.CreateOwner do
  use Ecto.Migration

  def change do
    create table(:owners) do
      add :owner_id, :integer
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :legal_address_id, :integer
      add :license_id, :integer

      timestamps
    end

  end
end
