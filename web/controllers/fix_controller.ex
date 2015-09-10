defmodule Wheelie.FixController do
  use Wheelie.Web, :controller

  alias Wheelie.Fix

  plug :scrub_params, "fix" when action in [:create, :update]

  def index(conn, _params) do
    fixes = Repo.all(Fix)
    render(conn, "index.html", fixes: fixes)
  end

  def new(conn, _params) do
    changeset = Fix.changeset(%Fix{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"fix" => fix_params}) do
    changeset = Fix.changeset(%Fix{}, fix_params)

    case Repo.insert(changeset) do
      {:ok, _fix} ->
        conn
        |> put_flash(:info, "Fix created successfully.")
        |> redirect(to: fix_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    fix = Repo.get!(Fix, id)
    render(conn, "show.html", fix: fix)
  end

  def edit(conn, %{"id" => id}) do
    fix = Repo.get!(Fix, id)
    changeset = Fix.changeset(fix)
    render(conn, "edit.html", fix: fix, changeset: changeset)
  end

  def update(conn, %{"id" => id, "fix" => fix_params}) do
    fix = Repo.get!(Fix, id)
    changeset = Fix.changeset(fix, fix_params)

    case Repo.update(changeset) do
      {:ok, fix} ->
        conn
        |> put_flash(:info, "Fix updated successfully.")
        |> redirect(to: fix_path(conn, :show, fix))
      {:error, changeset} ->
        render(conn, "edit.html", fix: fix, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    fix = Repo.get!(Fix, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(fix)

    conn
    |> put_flash(:info, "Fix deleted successfully.")
    |> redirect(to: fix_path(conn, :index))
  end
end
