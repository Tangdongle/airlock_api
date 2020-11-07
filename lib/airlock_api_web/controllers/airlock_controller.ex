defmodule AirlockApiWeb.AirlockController do
  use AirlockApiWeb, :controller

  alias AirlockApi.AirlockData
  alias AirlockApi.AirlockData.Airlock

  action_fallback AirlockApiWeb.FallbackController

  def index(conn, _params) do
    airdata = AirlockData.list_airdata()
    render(conn, "index.json", airdata: airdata)
  end

  def create(conn, airlock_params) do
    with {:ok, %Airlock{} = airlock} <- AirlockData.create_airlock(airlock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.airlock_path(conn, :show, airlock))
      |> render("show.json", airlock: airlock)
    end
  end

  def show(conn, %{"id" => id}) do
    airlock = AirlockData.get_airlock!(id)
    render(conn, "show.json", airlock: airlock)
  end

  def update(conn, %{"id" => id, "airlock" => airlock_params}) do
    airlock = AirlockData.get_airlock!(id)

    with {:ok, %Airlock{} = airlock} <- AirlockData.update_airlock(airlock, airlock_params) do
      render(conn, "show.json", airlock: airlock)
    end
  end

  def delete(conn, %{"id" => id}) do
    airlock = AirlockData.get_airlock!(id)

    with {:ok, %Airlock{}} <- AirlockData.delete_airlock(airlock) do
      send_resp(conn, :no_content, "")
    end
  end
end
