defmodule VehicleStore.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias VehicleStore.Repo

  alias VehicleStore.Inventory.Vehicle

  def list_unique_brands do
    from(v in Vehicle, group_by: v.brand, select: v.brand)
    |> Repo.all()
  end

  def filter_models_by_brand(brand) do
    from(v in Vehicle, where: v.brand == ^brand, group_by: v.model, select: v.model)
    |> Repo.all()
  end

  def filter_by_brand_and_model(brand, model) do
    from(v in Vehicle,
      where: v.brand == ^brand,
      where: v.model == ^model
    )
    |> Repo.all()
  end

  @doc """
  Returns the list of vehicles.

  ## Examples

      iex> list_vehicles()
      [%Vehicle{}, ...]

  """
  def list_vehicles do
    Repo.all(Vehicle)
  end

  @doc """
  Creates a vehicle.

  ## Examples

      iex> create_vehicle(%{field: value})
      {:ok, %Vehicle{}}

      iex> create_vehicle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vehicle(attrs \\ %{}) do
    %Vehicle{}
    |> Vehicle.changeset(attrs)
    |> Repo.insert()
  end
end
