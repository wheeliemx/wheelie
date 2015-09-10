defmodule Wheelie.Users do
  use Wheelie.Web, :model

  @primary_key false
  schema "user" do
    field :user_id, :integer
    field :first_name, :string
    field :last_name, :string
    field :legal_address_id, :integer

    timestamps
  end

  @required_fields ~w(user_id first_name last_name legal_address_id)
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
