defmodule Wheelie.BrandTest do
  use Wheelie.ModelCase

  alias Wheelie.Brand

  @valid_attrs %{brand: "some content", brand_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Brand.changeset(%Brand{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Brand.changeset(%Brand{}, @invalid_attrs)
    refute changeset.valid?
  end
end
