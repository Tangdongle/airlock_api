defmodule AirlockApiWeb.AirlockView do
  use AirlockApiWeb, :view
  alias AirlockApiWeb.AirlockView

  def render("index.json", %{airdata: airdata}) do
    %{data: render_many(airdata, AirlockView, "airlock.json")}
  end

  def render("show.json", %{airlock: airlock}) do
    %{data: render_one(airlock, AirlockView, "airlock.json")}
  end

  def render("airlock.json", %{airlock: airlock}) do
    %{id: airlock.id,
      device_id: airlock.device_id,
      device_name: airlock.device_name,
      bpm: airlock.bpm,
      temp: airlock.temp,
      sg: airlock.sg,
      bubbles: airlock.bubbles,
      og: airlock.og,
      abv: airlock.abv,
      co2_volume: airlock.co2_volume,
      batch_volume: airlock.batch_volume,
      temp_unit: airlock.temp_unit,
      volume_unit: airlock.volume_unit}
  end
end
