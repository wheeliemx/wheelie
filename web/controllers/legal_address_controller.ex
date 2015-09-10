defmodule Wheelie.LegalAddressController do
  use Wheelie.Web, :controller

  alias Wheelie.LegalAddress

  plug :scrub_params, "legal_address" when action in [:create, :update]

  def index(conn, _params) do
    legal_adresses = Repo.all(LegalAddress)
    render(conn, "index.html", legal_adresses: legal_adresses)
  end

  def new(conn, _params) do
    changeset = LegalAddress.changeset(%LegalAddress{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"legal_address" => legal_address_params}) do
    changeset = LegalAddress.changeset(%LegalAddress{}, legal_address_params)

    case Repo.insert(changeset) do
      {:ok, _legal_address} ->
        conn
        |> put_flash(:info, "Legal address created successfully.")
        |> redirect(to: legal_address_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    legal_address = Repo.get!(LegalAddress, id)
    render(conn, "show.html", legal_address: legal_address)
  end

  def edit(conn, %{"id" => id}) do
    legal_address = Repo.get!(LegalAddress, id)
    changeset = LegalAddress.changeset(legal_address)
    render(conn, "edit.html", legal_address: legal_address, changeset: changeset)
  end

  def update(conn, %{"id" => id, "legal_address" => legal_address_params}) do
    legal_address = Repo.get!(LegalAddress, id)
    changeset = LegalAddress.changeset(legal_address, legal_address_params)

    case Repo.update(changeset) do
      {:ok, legal_address} ->
        conn
        |> put_flash(:info, "Legal address updated successfully.")
        |> redirect(to: legal_address_path(conn, :show, legal_address))
      {:error, changeset} ->
        render(conn, "edit.html", legal_address: legal_address, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    legal_address = Repo.get!(LegalAddress, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(legal_address)

    conn
    |> put_flash(:info, "Legal address deleted successfully.")
    |> redirect(to: legal_address_path(conn, :index))
  end
end
