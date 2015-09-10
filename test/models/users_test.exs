defmodule Wheelie.UsersTest do
  use Wheelie.ModelCase

  alias Wheelie.Users

  @valid_attrs %{first_name: "some content", last_name: "some content", legal_address_id: 42, user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Users.changeset(%Users{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Users.changeset(%Users{}, @invalid_attrs)
    refute changeset.valid?
  end
end
