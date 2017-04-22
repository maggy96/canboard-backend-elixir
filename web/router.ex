defmodule Canboard.Router do
  use Canboard.Web, :router
  use Coherence.Router

  pipeline :frontend do

    scope "/", Canboard do
      coherence_routes :all
      get "/*path", PageController, :index
    end

    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: false
  end

  pipeline :api do

    scope "/api", Canboard do
      resources "/boards", BoardController, only: [:index, :show, :create, :update, :delete]
    end

    plug :accepts, ["json"]
    plug :fetch_session
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, cookie_expire: 10*60*60, login: &Canboard.PageController.index/1
  end

end
