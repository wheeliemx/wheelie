defmodule Wheelie.MechanicController do
  use Wheelie.Web, :controller

  alias Wheelie.Mechanic

  plug :scrub_params, "mechanic" when action in [:create, :update]

  def index(conn, _params) do
    mechanics = Repo.all(Mechanic)
    render(conn, "index.html", mechanics: mechanics)
  end

  def new(conn, _params) do
    changeset = Mechanic.changeset(%Mechanic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mechanic" => mechanic_params}) do
    changeset = Mechanic.changeset(%Mechanic{}, mechanic_params)

    case Repo.insert(changeset) do
      {:ok, _mechanic} ->
        conn
        |> put_flash(:info, "Mechanic created successfully.")
        |> redirect(to: mechanic_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mechanic = Repo.get!(Mechanic, id)
    render(conn, "show.html", mechanic: mechanic)
  end

  def edit(conn, %{"id" => id}) do
    mechanic = Repo.get!(Mechanic, id)
    changeset = Mechanic.changeset(mechanic)
    render(conn, "edit.html", mechanic: mechanic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mechanic" => mechanic_params}) do
    mechanic = Repo.get!(Mechanic, id)
    changeset = Mechanic.changeset(mechanic, mechanic_params)

    case Repo.update(changeset) do
      {:ok, mechanic} ->
        conn
        |> put_flash(:info, "Mechanic updated successfully.")
        |> redirect(to: mechanic_path(conn, :show, mechanic))
      {:error, changeset} ->
        render(conn, "edit.html", mechanic: mechanic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mechanic = Repo.get!(Mechanic, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mechanic)

    conn
    |> put_flash(:info, "Mechanic deleted successfully.")
    |> redirect(to: mechanic_path(conn, :index))
  end
end
