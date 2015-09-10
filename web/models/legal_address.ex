defmodule Wheelie.LegalAddress do
  use Wheelie.Web, :model

  @primary_key false
  schema "legal_adresses" do
    field :legal_address_id, :integer
    field :street, :string
    field :external_number, :string
    field :internal_number, :string
    field :neighborhood, :string
    field :locality, :string
    field :zip_code, :string
    field :city_id, :integer
    field :state_id, :integer
    field :country_id, :integer

    timestamps
  end

  @required_fields ~w(legal_address_id street external_number internal_number neighborhood locality zip_code city_id state_id country_id)
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
