defmodule VehicleStore.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VehicleStore.Inventory` context.
  """

  @doc """
  Generate a vehicle.
  """
  def vehicle_fixture(attrs \\ %{}) do
    {:ok, vehicle} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        model: "some model",
        year: 42
      })
      |> VehicleStore.Inventory.create_vehicle()

    vehicle
  end
end
