defmodule Wheelie.CarTest do
  use Wheelie.ModelCase

  alias Wheelie.Car

  @valid_attrs %{alternative_brand_name: "some content", alternative_model_name: "some content", brand_id: 42, car_id: 42, description: "some content", model_id: 42, user_id: 42, year: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Car.changeset(%Car{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Car.changeset(%Car{}, @invalid_attrs)
    refute changeset.valid?
  end
end
