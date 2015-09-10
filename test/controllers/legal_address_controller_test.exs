defmodule Wheelie.LegalAddressControllerTest do
  use Wheelie.ConnCase

  alias Wheelie.LegalAddress
  @valid_attrs %{city_id: 42, country_id: 42, external_number: "some content", internal_number: "some content", legal_address_id: 42, locality: "some content", neighborhood: "some content", state_id: 42, street: "some content", zip_code: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, legal_address_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing legal adresses"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, legal_address_path(conn, :new)
    assert html_response(conn, 200) =~ "New legal address"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, legal_address_path(conn, :create), legal_address: @valid_attrs
    assert redirected_to(conn) == legal_address_path(conn, :index)
    assert Repo.get_by(LegalAddress, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, legal_address_path(conn, :create), legal_address: @invalid_attrs
    assert html_response(conn, 200) =~ "New legal address"
  end

  test "shows chosen resource", %{conn: conn} do
    legal_address = Repo.insert! %LegalAddress{}
    conn = get conn, legal_address_path(conn, :show, legal_address)
    assert html_response(conn, 200) =~ "Show legal address"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, legal_address_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    legal_address = Repo.insert! %LegalAddress{}
    conn = get conn, legal_address_path(conn, :edit, legal_address)
    assert html_response(conn, 200) =~ "Edit legal address"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    legal_address = Repo.insert! %LegalAddress{}
    conn = put conn, legal_address_path(conn, :update, legal_address), legal_address: @valid_attrs
    assert redirected_to(conn) == legal_address_path(conn, :show, legal_address)
    assert Repo.get_by(LegalAddress, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    legal_address = Repo.insert! %LegalAddress{}
    conn = put conn, legal_address_path(conn, :update, legal_address), legal_address: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit legal address"
  end

  test "deletes chosen resource", %{conn: conn} do
    legal_address = Repo.insert! %LegalAddress{}
    conn = delete conn, legal_address_path(conn, :delete, legal_address)
    assert redirected_to(conn) == legal_address_path(conn, :index)
    refute Repo.get(LegalAddress, legal_address.id)
  end
end
