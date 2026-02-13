defmodule CvAppWeb.Router do
  use CvAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_root_layout, {CvAppWeb.LayoutView, :root}
    plug :put_secure_browser_headers
  end

  scope "/", CvAppWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/sitemap.xml", PageController, :sitemap
  end
end
