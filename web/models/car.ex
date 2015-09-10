defmodule Wheelie.Car do
  use Wheelie.Web, :model

  @primary_key false
  schema "cars" do
    field :car_id, :integer
    field :year, :string
    field :alternative_brand_name, :string
    field :alternative_model_name, :string
    field :description, :string
    field :user_id, :integer
    field :model_id, :integer
    field :brand_id, :integer

    timestamps
  end

  @required_fields ~w(car_id year alternative_brand_name alternative_model_name description user_id model_id brand_id)
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
