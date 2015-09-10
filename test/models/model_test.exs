defmodule Wheelie.ModelTest do
  use Wheelie.ModelCase

  alias Wheelie.Model

  @valid_attrs %{brand_id: 42, model: "some content", model_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Model.changeset(%Model{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Model.changeset(%Model{}, @invalid_attrs)
    refute changeset.valid?
  end
end
