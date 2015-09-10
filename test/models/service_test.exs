defmodule Wheelie.ServiceTest do
  use Wheelie.ModelCase

  alias Wheelie.Service

  @valid_attrs %{service: "some content", service_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Service.changeset(%Service{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Service.changeset(%Service{}, @invalid_attrs)
    refute changeset.valid?
  end
end
