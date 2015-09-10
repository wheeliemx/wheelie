defmodule Wheelie.Owner do
  use Wheelie.Web, :model

  @primary_key false
  schema "owners" do
    field :owner_id, :integer
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :legal_address_id, :integer
    field :license_id, :integer

    timestamps
  end

  @required_fields ~w(owner_id first_name last_name email legal_address_id license_id)
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
