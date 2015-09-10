defmodule Wheelie.OwnerTest do
  use Wheelie.ModelCase

  alias Wheelie.Owner

  @valid_attrs %{email: "some content", first_name: "some content", last_name: "some content", legal_address_id: 42, license_id: 42, owner_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Owner.changeset(%Owner{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Owner.changeset(%Owner{}, @invalid_attrs)
    refute changeset.valid?
  end
end
