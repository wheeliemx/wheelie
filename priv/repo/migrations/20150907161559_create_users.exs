defmodule Wheelie.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :user_id, :integer
      add :first_name, :string
      add :last_name, :string
      add :legal_address_id, :integer

      timestamps
    end

  end
end
