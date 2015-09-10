defmodule Wheelie.FixTest do
  use Wheelie.ModelCase

  alias Wheelie.Fix

  @valid_attrs %{car_id: 42, fix: "some content", fix_id: 42, mechanic_id: 42, service_id: 42, user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Fix.changeset(%Fix{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Fix.changeset(%Fix{}, @invalid_attrs)
    refute changeset.valid?
  end
end
