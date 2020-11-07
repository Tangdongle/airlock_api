defmodule AirlockApi.AirlockData.Airlock do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "airdata" do
    field :abv, :float
    field :batch_volume, :float
    field :bpm, :integer
    field :bubbles, :integer
    field :co2_volume, :float
    field :device_id, :integer
    field :device_name, :string
    field :og, :float
    field :sg, :float
    field :temp, :float
    field :temp_unit, :string
    field :volume_unit, :string

    timestamps()
  end

  @doc false
  def changeset(airlock, attrs) do
    airlock
    |> cast(attrs, [:device_id, :device_name, :bpm, :temp, :sg, :bubbles, :og, :abv, :co2_volume, :batch_volume, :temp_unit, :volume_unit])
    |> validate_required([:device_id, :device_name, :bpm, :temp, :sg, :bubbles, :og, :abv, :co2_volume, :batch_volume, :temp_unit, :volume_unit])
  end
end
