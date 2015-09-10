defmodule Wheelie.StateController do
  use Wheelie.Web, :controller

  alias Wheelie.State

  plug :scrub_params, "state" when action in [:create, :update]

  def index(conn, _params) do
    states = Repo.all(State)
    render(conn, "index.html", states: states)
  end

  def new(conn, _params) do
    changeset = State.changeset(%State{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"state" => state_params}) do
    changeset = State.changeset(%State{}, state_params)

    case Repo.insert(changeset) do
      {:ok, _state} ->
        conn
        |> put_flash(:info, "State created successfully.")
        |> redirect(to: state_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    state = Repo.get!(State, id)
    render(conn, "show.html", state: state)
  end

  def edit(conn, %{"id" => id}) do
    state = Repo.get!(State, id)
    changeset = State.changeset(state)
    render(conn, "edit.html", state: state, changeset: changeset)
  end

  def update(conn, %{"id" => id, "state" => state_params}) do
    state = Repo.get!(State, id)
    changeset = State.changeset(state, state_params)

    case Repo.update(changeset) do
      {:ok, state} ->
        conn
        |> put_flash(:info, "State updated successfully.")
        |> redirect(to: state_path(conn, :show, state))
      {:error, changeset} ->
        render(conn, "edit.html", state: state, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    state = Repo.get!(State, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(state)

    conn
    |> put_flash(:info, "State deleted successfully.")
    |> redirect(to: state_path(conn, :index))
  end
end
