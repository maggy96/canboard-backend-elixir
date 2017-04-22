defmodule Canboard.Router do
  use Canboard.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :api do
    plug :accepts, ["json"]
    # plug Coherence.Authentication.Session, protected: true
  end

  scope "/", Canboard do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    coherence_routes()
  end

  scope "/api", Canboard do
    pipe_through :api
    # coherence_routes :protected
  end

  # Other scopes may use custom stacks.
  # scope "/api", Canboard do
  #   pipe_through :api
  # end
end
