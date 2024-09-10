defmodule SFFT.APITest do
  use SFFTWeb.ConnCase, async: true
  import SFFT.DataFixtures

  setup do
    taco_truck = permit_fixture(name: "taco truck")
    schedule_fixture(location_id: taco_truck.location_id)

    burger_cart = permit_fixture(name: "burger cart")

    schedule_fixture(location_id: burger_cart.location_id)

    schedule_fixture(
      location_id: burger_cart.location_id,
      day: "Sunday",
      open: "10AM",
      close: "5PM"
    )

    :ok
  end

  test "list all permits", %{conn: conn} do
    query = "{allPermits {locationID name type schedules { day open close }}}"
    conn = post(conn, "/", %{"query" => query})

    assert %{"data" => %{"allPermits" => permits}} = json_response(conn, 200)
    assert Enum.count(permits) == 2

    taco_truck = Enum.find(permits, &(&1["name"] == "taco truck"))
    assert Enum.count(taco_truck["schedules"]) == 1

    burger_cart = Enum.find(permits, &(&1["name"] == "burger cart"))
    assert Enum.count(burger_cart["schedules"]) == 2
  end

  test "list all schedules", %{conn: conn} do
    query = "{allSchedules {day open close locationID}}"
    conn = post(conn, "/", %{"query" => query})

    assert %{"data" => %{"allSchedules" => schedules}} = json_response(conn, 200)
    assert Enum.count(schedules) == 3
  end
end
