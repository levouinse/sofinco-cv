defmodule CvAppWeb do
  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt resume.pdf)
  
  def __sockets__, do: []

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, namespace: CvAppWeb

      import Plug.Conn
      import CvAppWeb.Router.Helpers
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/cv_app_web/templates",
        namespace: CvAppWeb

      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      unquote(view_helpers())
    end
  end

  def html do
    quote do
      use Phoenix.Component
      import Phoenix.Controller, only: [get_csrf_token: 0, view_module: 1]

      unquote(html_helpers())
    end
  end

  defp html_helpers do
    quote do
      import Phoenix.HTML
      import CvAppWeb.CoreComponents
      import CvAppWeb.Router.Helpers

      alias Phoenix.LiveView.JS
    end
  end

  defp view_helpers do
    quote do
      import Phoenix.View
      import CvAppWeb.ErrorHelpers
      import CvAppWeb.Router.Helpers

      alias CvAppWeb.Router.Helpers, as: Routes
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
