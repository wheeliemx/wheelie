defmodule Wheelie.Router do
  use Wheelie.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Wheelie do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Wheelie do
    pipe_through :api
    resources "/users", UsersController
    resources "/brands", BrandController
    resources "/cars", CarController
    resources "/countries", CountryController
    resources "/states", StateController
    resources "/cities", CityController
    resources "/legal_adresses", LegalAddressController
    resources "/fixes", FixController
    resources "/licenses", LicenseController
    resources "/license_services", LicenseServiceController
    resources "/mechanics", MechanicController
    resources "/models", ModelController
    resources "/owners", OwnerController
    resources "/services", ServiceController    
  end
end
