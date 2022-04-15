defmodule VehicleStore.InventoryTest do
  use VehicleStore.DataCase

  alias VehicleStore.Inventory

  describe "vehicles" do
    alias VehicleStore.Inventory.Vehicle

    import VehicleStore.InventoryFixtures

    @invalid_attrs %{brand: nil, model: nil, year: nil}

    test "list_vehicles/0 returns all vehicles" do
      vehicle = vehicle_fixture()
      assert Inventory.list_vehicles() == [vehicle]
    end

    test "get_vehicle!/1 returns the vehicle with given id" do
      vehicle = vehicle_fixture()
      assert Inventory.get_vehicle!(vehicle.id) == vehicle
    end

    test "create_vehicle/1 with valid data creates a vehicle" do
      valid_attrs = %{brand: "some brand", model: "some model", year: 42}

      assert {:ok, %Vehicle{} = vehicle} = Inventory.create_vehicle(valid_attrs)
      assert vehicle.brand == "some brand"
      assert vehicle.model == "some model"
      assert vehicle.year == 42
    end

    test "create_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_vehicle(@invalid_attrs)
    end

    test "update_vehicle/2 with valid data updates the vehicle" do
      vehicle = vehicle_fixture()
      update_attrs = %{brand: "some updated brand", model: "some updated model", year: 43}

      assert {:ok, %Vehicle{} = vehicle} = Inventory.update_vehicle(vehicle, update_attrs)
      assert vehicle.brand == "some updated brand"
      assert vehicle.model == "some updated model"
      assert vehicle.year == 43
    end

    test "update_vehicle/2 with invalid data returns error changeset" do
      vehicle = vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_vehicle(vehicle, @invalid_attrs)
      assert vehicle == Inventory.get_vehicle!(vehicle.id)
    end

    test "delete_vehicle/1 deletes the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, %Vehicle{}} = Inventory.delete_vehicle(vehicle)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_vehicle!(vehicle.id) end
    end

    test "change_vehicle/1 returns a vehicle changeset" do
      vehicle = vehicle_fixture()
      assert %Ecto.Changeset{} = Inventory.change_vehicle(vehicle)
    end
  end
end
