defmodule Wheelie.Fix do
  use Wheelie.Web, :model

  @primary_key false
  schema "fixes" do
    field :fix_id, :integer
    field :fix, :string
    field :service_id, :integer
    field :mechanic_id, :integer
    field :car_id, :integer
    field :user_id, :integer

    timestamps
  end

  @required_fields ~w(fix_id fix service_id mechanic_id car_id user_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
