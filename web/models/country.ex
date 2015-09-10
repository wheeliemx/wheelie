defmodule Wheelie.Country do
  use Wheelie.Web, :model

  @primary_key false
  schema "countries" do
    field :country_id, :integer
    field :country, :string

    timestamps
  end

  @required_fields ~w(country_id country)
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
