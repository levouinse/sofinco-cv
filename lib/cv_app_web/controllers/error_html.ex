defmodule CvAppWeb.ErrorView do
  use CvAppWeb, :view

  def render(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
