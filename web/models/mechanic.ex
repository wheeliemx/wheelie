defmodule Wheelie.Mechanic do
  use Wheelie.Web, :model

  @primary_key false
  schema "mechanics" do
    field :mechanic_id, :integer
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :license_id, :integer

    timestamps
  end

  @required_fields ~w(mechanic_id first_name last_name email license_id)
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
