defmodule Wheelie.LicenseServiceTest do
  use Wheelie.ModelCase

  alias Wheelie.LicenseService

  @valid_attrs %{license_id: 42, license_service_id: 42, service_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LicenseService.changeset(%LicenseService{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LicenseService.changeset(%LicenseService{}, @invalid_attrs)
    refute changeset.valid?
  end
end
