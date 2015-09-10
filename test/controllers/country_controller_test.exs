defmodule Wheelie.CountryControllerTest do
  use Wheelie.ConnCase

  alias Wheelie.Country
  @valid_attrs %{country: "some content", country_id: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, country_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing countries"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, country_path(conn, :new)
    assert html_response(conn, 200) =~ "New country"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, country_path(conn, :create), country: @valid_attrs
    assert redirected_to(conn) == country_path(conn, :index)
    assert Repo.get_by(Country, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, country_path(conn, :create), country: @invalid_attrs
    assert html_response(conn, 200) =~ "New country"
  end

  test "shows chosen resource", %{conn: conn} do
    country = Repo.insert! %Country{}
    conn = get conn, country_path(conn, :show, country)
    assert html_response(conn, 200) =~ "Show country"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, country_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    country = Repo.insert! %Country{}
    conn = get conn, country_path(conn, :edit, country)
    assert html_response(conn, 200) =~ "Edit country"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    country = Repo.insert! %Country{}
    conn = put conn, country_path(conn, :update, country), country: @valid_attrs
    assert redirected_to(conn) == country_path(conn, :show, country)
    assert Repo.get_by(Country, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    country = Repo.insert! %Country{}
    conn = put conn, country_path(conn, :update, country), country: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit country"
  end

  test "deletes chosen resource", %{conn: conn} do
    country = Repo.insert! %Country{}
    conn = delete conn, country_path(conn, :delete, country)
    assert redirected_to(conn) == country_path(conn, :index)
    refute Repo.get(Country, country.id)
  end
end
