defmodule VehicleStore.Repo do
  use Ecto.Repo,
    otp_app: :vehicle_store,
    adapter: Ecto.Adapters.Postgres
end
