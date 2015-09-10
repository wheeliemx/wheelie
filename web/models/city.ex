defmodule Wheelie.City do
  use Wheelie.Web, :model

  @primary_key false
  schema "cities" do
    field :city_id, :integer
    field :city, :string
    field :prefix, :string
    field :state_id, :integer
    field :country_id, :integer

    timestamps
  end

  @required_fields ~w(city_id city prefix state_id country_id)
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
