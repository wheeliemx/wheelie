defmodule Wheelie.LicenseServiceControllerTest do
  use Wheelie.ConnCase

  alias Wheelie.LicenseService
  @valid_attrs %{license_id: 42, license_service_id: 42, service_id: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, license_service_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing license services"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, license_service_path(conn, :new)
    assert html_response(conn, 200) =~ "New license service"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, license_service_path(conn, :create), license_service: @valid_attrs
    assert redirected_to(conn) == license_service_path(conn, :index)
    assert Repo.get_by(LicenseService, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, license_service_path(conn, :create), license_service: @invalid_attrs
    assert html_response(conn, 200) =~ "New license service"
  end

  test "shows chosen resource", %{conn: conn} do
    license_service = Repo.insert! %LicenseService{}
    conn = get conn, license_service_path(conn, :show, license_service)
    assert html_response(conn, 200) =~ "Show license service"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, license_service_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    license_service = Repo.insert! %LicenseService{}
    conn = get conn, license_service_path(conn, :edit, license_service)
    assert html_response(conn, 200) =~ "Edit license service"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    license_service = Repo.insert! %LicenseService{}
    conn = put conn, license_service_path(conn, :update, license_service), license_service: @valid_attrs
    assert redirected_to(conn) == license_service_path(conn, :show, license_service)
    assert Repo.get_by(LicenseService, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    license_service = Repo.insert! %LicenseService{}
    conn = put conn, license_service_path(conn, :update, license_service), license_service: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit license service"
  end

  test "deletes chosen resource", %{conn: conn} do
    license_service = Repo.insert! %LicenseService{}
    conn = delete conn, license_service_path(conn, :delete, license_service)
    assert redirected_to(conn) == license_service_path(conn, :index)
    refute Repo.get(LicenseService, license_service.id)
  end
end
