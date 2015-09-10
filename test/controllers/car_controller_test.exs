defmodule Wheelie.CarControllerTest do
  use Wheelie.ConnCase

  alias Wheelie.Car
  @valid_attrs %{alternative_brand_name: "some content", alternative_model_name: "some content", brand_id: 42, car_id: 42, description: "some content", model_id: 42, user_id: 42, year: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, car_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing cars"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, car_path(conn, :new)
    assert html_response(conn, 200) =~ "New car"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, car_path(conn, :create), car: @valid_attrs
    assert redirected_to(conn) == car_path(conn, :index)
    assert Repo.get_by(Car, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, car_path(conn, :create), car: @invalid_attrs
    assert html_response(conn, 200) =~ "New car"
  end

  test "shows chosen resource", %{conn: conn} do
    car = Repo.insert! %Car{}
    conn = get conn, car_path(conn, :show, car)
    assert html_response(conn, 200) =~ "Show car"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, car_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    car = Repo.insert! %Car{}
    conn = get conn, car_path(conn, :edit, car)
    assert html_response(conn, 200) =~ "Edit car"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    car = Repo.insert! %Car{}
    conn = put conn, car_path(conn, :update, car), car: @valid_attrs
    assert redirected_to(conn) == car_path(conn, :show, car)
    assert Repo.get_by(Car, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    car = Repo.insert! %Car{}
    conn = put conn, car_path(conn, :update, car), car: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit car"
  end

  test "deletes chosen resource", %{conn: conn} do
    car = Repo.insert! %Car{}
    conn = delete conn, car_path(conn, :delete, car)
    assert redirected_to(conn) == car_path(conn, :index)
    refute Repo.get(Car, car.id)
  end
end
