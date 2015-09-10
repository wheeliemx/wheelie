defmodule Wheelie.LicenseController do
  use Wheelie.Web, :controller

  alias Wheelie.License

  plug :scrub_params, "license" when action in [:create, :update]

  def index(conn, _params) do
    licenses = Repo.all(License)
    render(conn, "index.html", licenses: licenses)
  end

  def new(conn, _params) do
    changeset = License.changeset(%License{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"license" => license_params}) do
    changeset = License.changeset(%License{}, license_params)

    case Repo.insert(changeset) do
      {:ok, _license} ->
        conn
        |> put_flash(:info, "License created successfully.")
        |> redirect(to: license_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    license = Repo.get!(License, id)
    render(conn, "show.html", license: license)
  end

  def edit(conn, %{"id" => id}) do
    license = Repo.get!(License, id)
    changeset = License.changeset(license)
    render(conn, "edit.html", license: license, changeset: changeset)
  end

  def update(conn, %{"id" => id, "license" => license_params}) do
    license = Repo.get!(License, id)
    changeset = License.changeset(license, license_params)

    case Repo.update(changeset) do
      {:ok, license} ->
        conn
        |> put_flash(:info, "License updated successfully.")
        |> redirect(to: license_path(conn, :show, license))
      {:error, changeset} ->
        render(conn, "edit.html", license: license, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    license = Repo.get!(License, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(license)

    conn
    |> put_flash(:info, "License deleted successfully.")
    |> redirect(to: license_path(conn, :index))
  end
end
