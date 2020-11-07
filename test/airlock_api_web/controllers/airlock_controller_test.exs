defmodule AirlockApiWeb.AirlockControllerTest do
  use AirlockApiWeb.ConnCase

  alias AirlockApi.AirlockData
  alias AirlockApi.AirlockData.Airlock

  @create_attrs %{
    abv: 120.5,
    batch_volume: 120.5,
    bpm: 42,
    bubbles: 42,
    co2_volume: 120.5,
    device_id: 42,
    device_name: "some device_name",
    og: 120.5,
    sg: 120.5,
    temp: 120.5,
    temp_unit: "some temp_unit",
    volume_unit: "some volume_unit"
  }
  @update_attrs %{
    abv: 456.7,
    batch_volume: 456.7,
    bpm: 43,
    bubbles: 43,
    co2_volume: 456.7,
    device_id: 43,
    device_name: "some updated device_name",
    og: 456.7,
    sg: 456.7,
    temp: 456.7,
    temp_unit: "some updated temp_unit",
    volume_unit: "some updated volume_unit"
  }
  @invalid_attrs %{abv: nil, batch_volume: nil, bpm: nil, bubbles: nil, co2_volume: nil, device_id: nil, device_name: nil, og: nil, sg: nil, temp: nil, temp_unit: nil, volume_unit: nil}

  def fixture(:airlock) do
    {:ok, airlock} = AirlockData.create_airlock(@create_attrs)
    airlock
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all airdata", %{conn: conn} do
      conn = get(conn, Routes.airlock_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create airlock" do
    test "renders airlock when data is valid", %{conn: conn} do
      conn = post(conn, Routes.airlock_path(conn, :create), airlock: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.airlock_path(conn, :show, id))

      assert %{
               "id" => id,
               "abv" => 120.5,
               "batch_volume" => 120.5,
               "bpm" => 42,
               "bubbles" => 42,
               "co2_volume" => 120.5,
               "device_id" => 42,
               "device_name" => "some device_name",
               "og" => 120.5,
               "sg" => 120.5,
               "temp" => 120.5,
               "temp_unit" => "some temp_unit",
               "volume_unit" => "some volume_unit"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.airlock_path(conn, :create), airlock: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update airlock" do
    setup [:create_airlock]

    test "renders airlock when data is valid", %{conn: conn, airlock: %Airlock{id: id} = airlock} do
      conn = put(conn, Routes.airlock_path(conn, :update, airlock), airlock: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.airlock_path(conn, :show, id))

      assert %{
               "id" => id,
               "abv" => 456.7,
               "batch_volume" => 456.7,
               "bpm" => 43,
               "bubbles" => 43,
               "co2_volume" => 456.7,
               "device_id" => 43,
               "device_name" => "some updated device_name",
               "og" => 456.7,
               "sg" => 456.7,
               "temp" => 456.7,
               "temp_unit" => "some updated temp_unit",
               "volume_unit" => "some updated volume_unit"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, airlock: airlock} do
      conn = put(conn, Routes.airlock_path(conn, :update, airlock), airlock: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete airlock" do
    setup [:create_airlock]

    test "deletes chosen airlock", %{conn: conn, airlock: airlock} do
      conn = delete(conn, Routes.airlock_path(conn, :delete, airlock))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.airlock_path(conn, :show, airlock))
      end
    end
  end

  defp create_airlock(_) do
    airlock = fixture(:airlock)
    %{airlock: airlock}
  end
end
