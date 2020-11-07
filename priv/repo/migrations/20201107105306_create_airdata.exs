defmodule AirlockApi.Repo.Migrations.CreateAirdata do
  use Ecto.Migration

  def change do
    create table(:airdata, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :device_id, :integer
      add :device_name, :string
      add :bpm, :integer
      add :temp, :float
      add :sg, :float
      add :bubbles, :integer
      add :og, :float
      add :abv, :float
      add :co2_volume, :float
      add :batch_volume, :float
      add :temp_unit, :string
      add :volume_unit, :string

      timestamps()
    end

  end
end
