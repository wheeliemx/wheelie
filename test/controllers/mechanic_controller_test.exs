defmodule Wheelie.MechanicControllerTest do
  use Wheelie.ConnCase

  alias Wheelie.Mechanic
  @valid_attrs %{email: "some content", first_name: "some content", last_name: "some content", license_id: 42, mechanic_id: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mechanic_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing mechanics"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, mechanic_path(conn, :new)
    assert html_response(conn, 200) =~ "New mechanic"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, mechanic_path(conn, :create), mechanic: @valid_attrs
    assert redirected_to(conn) == mechanic_path(conn, :index)
    assert Repo.get_by(Mechanic, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mechanic_path(conn, :create), mechanic: @invalid_attrs
    assert html_response(conn, 200) =~ "New mechanic"
  end

  test "shows chosen resource", %{conn: conn} do
    mechanic = Repo.insert! %Mechanic{}
    conn = get conn, mechanic_path(conn, :show, mechanic)
    assert html_response(conn, 200) =~ "Show mechanic"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, mechanic_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    mechanic = Repo.insert! %Mechanic{}
    conn = get conn, mechanic_path(conn, :edit, mechanic)
    assert html_response(conn, 200) =~ "Edit mechanic"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    mechanic = Repo.insert! %Mechanic{}
    conn = put conn, mechanic_path(conn, :update, mechanic), mechanic: @valid_attrs
    assert redirected_to(conn) == mechanic_path(conn, :show, mechanic)
    assert Repo.get_by(Mechanic, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mechanic = Repo.insert! %Mechanic{}
    conn = put conn, mechanic_path(conn, :update, mechanic), mechanic: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit mechanic"
  end

  test "deletes chosen resource", %{conn: conn} do
    mechanic = Repo.insert! %Mechanic{}
    conn = delete conn, mechanic_path(conn, :delete, mechanic)
    assert redirected_to(conn) == mechanic_path(conn, :index)
    refute Repo.get(Mechanic, mechanic.id)
  end
end
