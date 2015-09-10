defmodule Wheelie.FixControllerTest do
  use Wheelie.ConnCase

  alias Wheelie.Fix
  @valid_attrs %{car_id: 42, fix: "some content", fix_id: 42, mechanic_id: 42, service_id: 42, user_id: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, fix_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing fixes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, fix_path(conn, :new)
    assert html_response(conn, 200) =~ "New fix"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, fix_path(conn, :create), fix: @valid_attrs
    assert redirected_to(conn) == fix_path(conn, :index)
    assert Repo.get_by(Fix, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, fix_path(conn, :create), fix: @invalid_attrs
    assert html_response(conn, 200) =~ "New fix"
  end

  test "shows chosen resource", %{conn: conn} do
    fix = Repo.insert! %Fix{}
    conn = get conn, fix_path(conn, :show, fix)
    assert html_response(conn, 200) =~ "Show fix"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, fix_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    fix = Repo.insert! %Fix{}
    conn = get conn, fix_path(conn, :edit, fix)
    assert html_response(conn, 200) =~ "Edit fix"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    fix = Repo.insert! %Fix{}
    conn = put conn, fix_path(conn, :update, fix), fix: @valid_attrs
    assert redirected_to(conn) == fix_path(conn, :show, fix)
    assert Repo.get_by(Fix, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    fix = Repo.insert! %Fix{}
    conn = put conn, fix_path(conn, :update, fix), fix: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit fix"
  end

  test "deletes chosen resource", %{conn: conn} do
    fix = Repo.insert! %Fix{}
    conn = delete conn, fix_path(conn, :delete, fix)
    assert redirected_to(conn) == fix_path(conn, :index)
    refute Repo.get(Fix, fix.id)
  end
end
