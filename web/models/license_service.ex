defmodule Wheelie.LicenseService do
  use Wheelie.Web, :model

  @primary_key false
  schema "license_services" do
    field :license_service_id, :integer
    field :service_id, :integer
    field :license_id, :integer

    timestamps
  end

  @required_fields ~w(license_service_id service_id license_id)
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
