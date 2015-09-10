defmodule Wheelie.LegalAddressTest do
  use Wheelie.ModelCase

  alias Wheelie.LegalAddress

  @valid_attrs %{city_id: 42, country_id: 42, external_number: "some content", internal_number: "some content", legal_address_id: 42, locality: "some content", neighborhood: "some content", state_id: 42, street: "some content", zip_code: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LegalAddress.changeset(%LegalAddress{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LegalAddress.changeset(%LegalAddress{}, @invalid_attrs)
    refute changeset.valid?
  end
end
