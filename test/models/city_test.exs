defmodule Wheelie.CityTest do
  use Wheelie.ModelCase

  alias Wheelie.City

  @valid_attrs %{city: "some content", city_id: 42, country_id: 42, prefix: "some content", state_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = City.changeset(%City{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = City.changeset(%City{}, @invalid_attrs)
    refute changeset.valid?
  end
end
