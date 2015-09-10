defmodule Wheelie.License do
  use Wheelie.Web, :model

  @primary_key false
  schema "licenses" do
    field :license_id, :integer
    field :license, :string

    timestamps
  end

  @required_fields ~w(license_id license)
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
