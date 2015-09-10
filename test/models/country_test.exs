defmodule Wheelie.CountryTest do
  use Wheelie.ModelCase

  alias Wheelie.Country

  @valid_attrs %{country: "some content", country_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Country.changeset(%Country{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Country.changeset(%Country{}, @invalid_attrs)
    refute changeset.valid?
  end
end
