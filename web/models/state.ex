defmodule Wheelie.State do
  use Wheelie.Web, :model

  @primary_key false
  schema "states" do
    field :state_id, :integer
    field :state, :string
    field :state_prefix, :string
    field :country_id, :integer

    timestamps
  end

  @required_fields ~w(state_id state state_prefix country_id)
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
