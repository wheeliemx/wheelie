defmodule Wheelie.Model do
  use Wheelie.Web, :model

  @primary_key false
  schema "models" do
    field :model_id, :integer
    field :model, :string
    field :brand_id, :integer

    timestamps
  end

  @required_fields ~w(model_id model brand_id)
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
