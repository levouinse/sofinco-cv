defmodule CvAppWeb.CoreComponents do
  use Phoenix.Component

  def icon(%{name: "hero-" <> _} = assigns) do
    assigns = assign_new(assigns, :class, fn -> nil end)
    
    ~H"""
    <span class={[@name, @class]} />
    """
  end
end
