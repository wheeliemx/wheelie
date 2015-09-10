defmodule Wheelie.LicenseServiceController do
  use Wheelie.Web, :controller

  alias Wheelie.LicenseService

  plug :scrub_params, "license_service" when action in [:create, :update]

  def index(conn, _params) do
    license_services = Repo.all(LicenseService)
    render(conn, "index.html", license_services: license_services)
  end

  def new(conn, _params) do
    changeset = LicenseService.changeset(%LicenseService{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"license_service" => license_service_params}) do
    changeset = LicenseService.changeset(%LicenseService{}, license_service_params)

    case Repo.insert(changeset) do
      {:ok, _license_service} ->
        conn
        |> put_flash(:info, "License service created successfully.")
        |> redirect(to: license_service_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    license_service = Repo.get!(LicenseService, id)
    render(conn, "show.html", license_service: license_service)
  end

  def edit(conn, %{"id" => id}) do
    license_service = Repo.get!(LicenseService, id)
    changeset = LicenseService.changeset(license_service)
    render(conn, "edit.html", license_service: license_service, changeset: changeset)
  end

  def update(conn, %{"id" => id, "license_service" => license_service_params}) do
    license_service = Repo.get!(LicenseService, id)
    changeset = LicenseService.changeset(license_service, license_service_params)

    case Repo.update(changeset) do
      {:ok, license_service} ->
        conn
        |> put_flash(:info, "License service updated successfully.")
        |> redirect(to: license_service_path(conn, :show, license_service))
      {:error, changeset} ->
        render(conn, "edit.html", license_service: license_service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    license_service = Repo.get!(LicenseService, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(license_service)

    conn
    |> put_flash(:info, "License service deleted successfully.")
    |> redirect(to: license_service_path(conn, :index))
  end
end
