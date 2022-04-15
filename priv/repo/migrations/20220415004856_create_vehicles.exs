defmodule VehicleStore.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :brand, :string
      add :model, :string
      add :year, :integer

      timestamps()
    end
  end
end
