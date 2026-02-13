defmodule CvAppWeb.Components do
  use Phoenix.Component

  def button(assigns) do
    assigns = assign_new(assigns, :variant, fn -> "primary" end)
    assigns = assign_new(assigns, :href, fn -> nil end)
    assigns = assign_new(assigns, :class, fn -> "" end)
    ~H"""
    <a
      href={@href}
      class={[
        "group relative inline-flex items-center justify-center rounded-xl px-4 sm:px-6 py-2.5 sm:py-3 text-sm sm:text-base font-medium transition-all overflow-hidden",
        variant_class(@variant),
        @class
      ]}
    >
      <span class="relative z-10">
        <%= render_slot(@inner_block) %>
      </span>
      <div class="absolute inset-0 bg-gradient-to-r from-transparent via-white/20 to-transparent translate-x-[-100%] group-hover:translate-x-[100%] transition-transform duration-700"></div>
    </a>
    """
  end

  def card(assigns) do
    assigns = assign_new(assigns, :class, fn -> "" end)
    ~H"""
    <div class={["group rounded-2xl border transition-all duration-500 border-zinc-200 dark:border-zinc-800 bg-gradient-to-br from-white to-zinc-50 dark:from-zinc-950 dark:to-zinc-900 p-4 sm:p-6 shadow-sm hover:shadow-xl hover:border-rose-200 dark:hover:border-rose-900 hover:-translate-y-1 relative z-10 overflow-hidden", @class]}>
      <div class="absolute inset-0 bg-gradient-to-br from-rose-50/50 to-transparent dark:from-rose-950/20 dark:to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
      <div class="relative z-10">
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  def badge(assigns) do
    assigns = assign_new(assigns, :class, fn -> "" end)
    ~H"""
    <span class={["inline-flex items-center rounded-full bg-gradient-to-r from-zinc-100 to-zinc-50 dark:from-zinc-800 dark:to-zinc-900 border border-zinc-200 dark:border-zinc-700 px-3 py-1 text-xs font-semibold text-zinc-900 dark:text-zinc-100 shadow-sm hover:shadow-md hover:scale-105 transition-all duration-300", @class]}>
      <%= render_slot(@inner_block) %>
    </span>
    """
  end

  def section(assigns) do
    assigns = assign_new(assigns, :class, fn -> "" end)
    ~H"""
    <section class={["py-8 md:py-12", @class]}>
      <h2 class="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white mb-6 md:mb-8"><%= @title %></h2>
      <%= render_slot(@inner_block) %>
    </section>
    """
  end

  def container(assigns) do
    assigns = assign_new(assigns, :class, fn -> "" end)
    ~H"""
    <div class={["max-w-4xl mx-auto px-4 sm:px-6 relative z-10", @class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp variant_class("primary"), do: "bg-gradient-to-r from-rose-600 to-rose-700 hover:from-rose-700 hover:to-rose-800 text-white shadow-lg shadow-rose-500/30 hover:shadow-xl hover:shadow-rose-500/50 hover:scale-105"
  defp variant_class("secondary"), do: "bg-gradient-to-r from-zinc-100 to-zinc-50 dark:from-zinc-800 dark:to-zinc-900 border border-zinc-200 dark:border-zinc-700 hover:border-zinc-300 dark:hover:border-zinc-600 text-zinc-900 dark:text-zinc-100 shadow-md hover:shadow-lg hover:scale-105"
  defp variant_class(_), do: "bg-gradient-to-r from-rose-600 to-rose-700 text-white shadow-lg hover:scale-105"
end
