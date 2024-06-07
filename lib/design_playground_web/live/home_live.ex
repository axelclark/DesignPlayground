defmodule DesignPlaygroundWeb.HomeLive do
  use DesignPlaygroundWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <.button class="transition ease-in-out delay-150 !bg-blue-500 hover:-translate-y-1 hover:scale-105 hover:!bg-indigo-500 duration-300">
      Save Changes
    </.button>
    <div class="mt-12">
      <.button class="animate-fade-out">
        Save Changes
      </.button>
    </div>
    <div class="mt-12">
      <.button phx-click="animate">
        Animate
      </.button>
    </div>
    <div class="mt-12">
      <.button id="animate-button" data-animate={JS.add_class("animate-fade-out")}>
        Animated
      </.button>
    </div>
    <div id="item">My Item</div>
    <button phx-click={
      JS.transition({"ease-out duration-300 both", "opacity-100", "opacity-0"}, to: "#item")
    }>
      Shake!
    </button>
    """
  end

  @impl true
  def handle_event("animate", _params, socket) do
    {:noreply, push_event(socket, "animate", %{id: "animate-button"})}
  end
end
