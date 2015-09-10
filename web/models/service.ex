defmodule Wheelie.Service do
  use Wheelie.Web, :model

  @primary_key false
  schema "services" do
    field :service_id, :integer
    field :service, :string

    timestamps
  end

  @required_fields ~w(service_id service)
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
