defmodule Wheelie.Repo.Migrations.CreateState do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :state_id, :integer
      add :state, :string
      add :state_prefix, :string
      add :country_id, :integer

      timestamps
    end

  end
end
