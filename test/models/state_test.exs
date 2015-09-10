defmodule Wheelie.StateTest do
  use Wheelie.ModelCase

  alias Wheelie.State

  @valid_attrs %{country_id: 42, state: "some content", state_id: 42, state_prefix: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = State.changeset(%State{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = State.changeset(%State{}, @invalid_attrs)
    refute changeset.valid?
  end
end
