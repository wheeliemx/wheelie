defmodule Wheelie.LicenseTest do
  use Wheelie.ModelCase

  alias Wheelie.License

  @valid_attrs %{license: "some content", license_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = License.changeset(%License{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = License.changeset(%License{}, @invalid_attrs)
    refute changeset.valid?
  end
end
