defmodule SehatHospitalWeb.Router do
  use SehatHospitalWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  scope "/", SehatHospitalWeb do
    pipe_through :browser

    get "/", PageController, :index

    scope "/admin", Admin do
      resources "/hospitals", HospitalController
      resources "/doctors", DoctorController
      resources "/patients", PatientController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", SehatHospitalWeb do
  #   pipe_through :api
  # end
end
