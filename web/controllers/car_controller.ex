defmodule Wheelie.CarController do
  use Wheelie.Web, :controller

  alias Wheelie.Car

  plug :scrub_params, "car" when action in [:create, :update]

  def index(conn, _params) do
    cars = Repo.all(Car)
    render(conn, "index.html", cars: cars)
  end

  def new(conn, _params) do
    changeset = Car.changeset(%Car{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"car" => car_params}) do
    changeset = Car.changeset(%Car{}, car_params)

    case Repo.insert(changeset) do
      {:ok, _car} ->
        conn
        |> put_flash(:info, "Car created successfully.")
        |> redirect(to: car_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    car = Repo.get!(Car, id)
    render(conn, "show.html", car: car)
  end

  def edit(conn, %{"id" => id}) do
    car = Repo.get!(Car, id)
    changeset = Car.changeset(car)
    render(conn, "edit.html", car: car, changeset: changeset)
  end

  def update(conn, %{"id" => id, "car" => car_params}) do
    car = Repo.get!(Car, id)
    changeset = Car.changeset(car, car_params)

    case Repo.update(changeset) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Car updated successfully.")
        |> redirect(to: car_path(conn, :show, car))
      {:error, changeset} ->
        render(conn, "edit.html", car: car, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    car = Repo.get!(Car, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(car)

    conn
    |> put_flash(:info, "Car deleted successfully.")
    |> redirect(to: car_path(conn, :index))
  end
end
