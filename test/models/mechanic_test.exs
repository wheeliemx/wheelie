defmodule Wheelie.MechanicTest do
  use Wheelie.ModelCase

  alias Wheelie.Mechanic

  @valid_attrs %{email: "some content", first_name: "some content", last_name: "some content", license_id: 42, mechanic_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Mechanic.changeset(%Mechanic{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Mechanic.changeset(%Mechanic{}, @invalid_attrs)
    refute changeset.valid?
  end
end
