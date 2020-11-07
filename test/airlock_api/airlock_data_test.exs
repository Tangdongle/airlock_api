defmodule AirlockApi.AirlockDataTest do
  use AirlockApi.DataCase

  alias AirlockApi.AirlockData

  describe "airdata" do
    alias AirlockApi.AirlockData.Airlock

    @valid_attrs %{abv: 120.5, batch_volume: 120.5, bpm: 42, bubbles: 42, co2_volume: 120.5, device_id: 42, device_name: "some device_name", og: 120.5, sg: 120.5, temp: 120.5, temp_unit: "some temp_unit", volumne_unit: "some volumne_unit"}
    @update_attrs %{abv: 456.7, batch_volume: 456.7, bpm: 43, bubbles: 43, co2_volume: 456.7, device_id: 43, device_name: "some updated device_name", og: 456.7, sg: 456.7, temp: 456.7, temp_unit: "some updated temp_unit", volumne_unit: "some updated volumne_unit"}
    @invalid_attrs %{abv: nil, batch_volume: nil, bpm: nil, bubbles: nil, co2_volume: nil, device_id: nil, device_name: nil, og: nil, sg: nil, temp: nil, temp_unit: nil, volumne_unit: nil}

    def airlock_fixture(attrs \\ %{}) do
      {:ok, airlock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AirlockData.create_airlock()

      airlock
    end

    test "list_airdata/0 returns all airdata" do
      airlock = airlock_fixture()
      assert AirlockData.list_airdata() == [airlock]
    end

    test "get_airlock!/1 returns the airlock with given id" do
      airlock = airlock_fixture()
      assert AirlockData.get_airlock!(airlock.id) == airlock
    end

    test "create_airlock/1 with valid data creates a airlock" do
      assert {:ok, %Airlock{} = airlock} = AirlockData.create_airlock(@valid_attrs)
      assert airlock.abv == 120.5
      assert airlock.batch_volume == 120.5
      assert airlock.bpm == 42
      assert airlock.bubbles == 42
      assert airlock.co2_volume == 120.5
      assert airlock.device_id == 42
      assert airlock.device_name == "some device_name"
      assert airlock.og == 120.5
      assert airlock.sg == 120.5
      assert airlock.temp == 120.5
      assert airlock.temp_unit == "some temp_unit"
      assert airlock.volumne_unit == "some volumne_unit"
    end

    test "create_airlock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AirlockData.create_airlock(@invalid_attrs)
    end

    test "update_airlock/2 with valid data updates the airlock" do
      airlock = airlock_fixture()
      assert {:ok, %Airlock{} = airlock} = AirlockData.update_airlock(airlock, @update_attrs)
      assert airlock.abv == 456.7
      assert airlock.batch_volume == 456.7
      assert airlock.bpm == 43
      assert airlock.bubbles == 43
      assert airlock.co2_volume == 456.7
      assert airlock.device_id == 43
      assert airlock.device_name == "some updated device_name"
      assert airlock.og == 456.7
      assert airlock.sg == 456.7
      assert airlock.temp == 456.7
      assert airlock.temp_unit == "some updated temp_unit"
      assert airlock.volumne_unit == "some updated volumne_unit"
    end

    test "update_airlock/2 with invalid data returns error changeset" do
      airlock = airlock_fixture()
      assert {:error, %Ecto.Changeset{}} = AirlockData.update_airlock(airlock, @invalid_attrs)
      assert airlock == AirlockData.get_airlock!(airlock.id)
    end

    test "delete_airlock/1 deletes the airlock" do
      airlock = airlock_fixture()
      assert {:ok, %Airlock{}} = AirlockData.delete_airlock(airlock)
      assert_raise Ecto.NoResultsError, fn -> AirlockData.get_airlock!(airlock.id) end
    end

    test "change_airlock/1 returns a airlock changeset" do
      airlock = airlock_fixture()
      assert %Ecto.Changeset{} = AirlockData.change_airlock(airlock)
    end
  end

  describe "airdata" do
    alias AirlockApi.AirlockData.Airlock

    @valid_attrs %{abv: 120.5, batch_volume: 120.5, bpm: 42, bubbles: 42, co2_volume: 120.5, device_id: 42, device_name: "some device_name", og: 120.5, sg: 120.5, temp: 120.5, temp_unit: "some temp_unit", volume_unit: "some volume_unit"}
    @update_attrs %{abv: 456.7, batch_volume: 456.7, bpm: 43, bubbles: 43, co2_volume: 456.7, device_id: 43, device_name: "some updated device_name", og: 456.7, sg: 456.7, temp: 456.7, temp_unit: "some updated temp_unit", volume_unit: "some updated volume_unit"}
    @invalid_attrs %{abv: nil, batch_volume: nil, bpm: nil, bubbles: nil, co2_volume: nil, device_id: nil, device_name: nil, og: nil, sg: nil, temp: nil, temp_unit: nil, volume_unit: nil}

    def airlock_fixture(attrs \\ %{}) do
      {:ok, airlock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AirlockData.create_airlock()

      airlock
    end

    test "list_airdata/0 returns all airdata" do
      airlock = airlock_fixture()
      assert AirlockData.list_airdata() == [airlock]
    end

    test "get_airlock!/1 returns the airlock with given id" do
      airlock = airlock_fixture()
      assert AirlockData.get_airlock!(airlock.id) == airlock
    end

    test "create_airlock/1 with valid data creates a airlock" do
      assert {:ok, %Airlock{} = airlock} = AirlockData.create_airlock(@valid_attrs)
      assert airlock.abv == 120.5
      assert airlock.batch_volume == 120.5
      assert airlock.bpm == 42
      assert airlock.bubbles == 42
      assert airlock.co2_volume == 120.5
      assert airlock.device_id == 42
      assert airlock.device_name == "some device_name"
      assert airlock.og == 120.5
      assert airlock.sg == 120.5
      assert airlock.temp == 120.5
      assert airlock.temp_unit == "some temp_unit"
      assert airlock.volume_unit == "some volume_unit"
    end

    test "create_airlock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AirlockData.create_airlock(@invalid_attrs)
    end

    test "update_airlock/2 with valid data updates the airlock" do
      airlock = airlock_fixture()
      assert {:ok, %Airlock{} = airlock} = AirlockData.update_airlock(airlock, @update_attrs)
      assert airlock.abv == 456.7
      assert airlock.batch_volume == 456.7
      assert airlock.bpm == 43
      assert airlock.bubbles == 43
      assert airlock.co2_volume == 456.7
      assert airlock.device_id == 43
      assert airlock.device_name == "some updated device_name"
      assert airlock.og == 456.7
      assert airlock.sg == 456.7
      assert airlock.temp == 456.7
      assert airlock.temp_unit == "some updated temp_unit"
      assert airlock.volume_unit == "some updated volume_unit"
    end

    test "update_airlock/2 with invalid data returns error changeset" do
      airlock = airlock_fixture()
      assert {:error, %Ecto.Changeset{}} = AirlockData.update_airlock(airlock, @invalid_attrs)
      assert airlock == AirlockData.get_airlock!(airlock.id)
    end

    test "delete_airlock/1 deletes the airlock" do
      airlock = airlock_fixture()
      assert {:ok, %Airlock{}} = AirlockData.delete_airlock(airlock)
      assert_raise Ecto.NoResultsError, fn -> AirlockData.get_airlock!(airlock.id) end
    end

    test "change_airlock/1 returns a airlock changeset" do
      airlock = airlock_fixture()
      assert %Ecto.Changeset{} = AirlockData.change_airlock(airlock)
    end
  end
end
