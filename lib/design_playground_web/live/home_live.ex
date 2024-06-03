defmodule DesignPlaygroundWeb.HomeLive do
  use DesignPlaygroundWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      Hello World!
    </div>
    """
  end
end
