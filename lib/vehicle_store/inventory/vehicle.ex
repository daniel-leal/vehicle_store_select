defmodule VehicleStore.Inventory.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vehicles" do
    field :brand, :string
    field :model, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:brand, :model, :year])
    |> validate_required([:brand, :model, :year])
  end
end
