defmodule VehicleStoreWeb.VehicleLive.Index do
  use VehicleStoreWeb, :live_view

  alias VehicleStore.Inventory

  @impl true
  def mount(_params, _session, socket) do
    brands = Inventory.list_unique_brands()

    {:ok,
     socket
     |> assign(:vehicles, [])
     |> assign(:models, [])
     |> assign(:selected_brand, nil)
     |> assign(:brands, brands)}
  end

  @impl true
  def handle_event("set-filter", %{"_target" => ["brand"], "brand" => brand}, socket) do
    {:noreply,
     socket
     |> assign(:models, Inventory.filter_models_by_brand(brand))
     |> assign(:selected_brand, brand)}
  end

  @impl true
  def handle_event("set-filter", %{"_target" => ["model"], "model" => model}, socket) do
    selected_brand = socket.assigns.selected_brand

    vehicles = Inventory.filter_by_brand_and_model(selected_brand, model)

    {:noreply, assign(socket, :vehicles, vehicles)}
  end
end
