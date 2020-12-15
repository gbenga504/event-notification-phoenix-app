defmodule NotificationApiWeb.HangoutControllerTest do
  use NotificationApiWeb.ConnCase

  alias NotificationApi.Event
  alias NotificationApi.Event.Hangout

  @create_attrs %{
    country: "some country",
    link: "some link",
    message: "some message",
    state: "some state"
  }
  @update_attrs %{
    country: "some updated country",
    link: "some updated link",
    message: "some updated message",
    state: "some updated state"
  }
  @invalid_attrs %{country: nil, link: nil, message: nil, state: nil}

  def fixture(:hangout) do
    {:ok, hangout} = Event.create_hangout(@create_attrs)
    hangout
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all hangouts", %{conn: conn} do
      conn = get(conn, Routes.hangout_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create hangout" do
    test "renders hangout when data is valid", %{conn: conn} do
      conn = post(conn, Routes.hangout_path(conn, :create), hangout: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.hangout_path(conn, :show, id))

      assert %{
               "id" => id,
               "country" => "some country",
               "link" => "some link",
               "message" => "some message",
               "state" => "some state"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.hangout_path(conn, :create), hangout: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update hangout" do
    setup [:create_hangout]

    test "renders hangout when data is valid", %{conn: conn, hangout: %Hangout{id: id} = hangout} do
      conn = put(conn, Routes.hangout_path(conn, :update, hangout), hangout: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.hangout_path(conn, :show, id))

      assert %{
               "id" => id,
               "country" => "some updated country",
               "link" => "some updated link",
               "message" => "some updated message",
               "state" => "some updated state"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, hangout: hangout} do
      conn = put(conn, Routes.hangout_path(conn, :update, hangout), hangout: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete hangout" do
    setup [:create_hangout]

    test "deletes chosen hangout", %{conn: conn, hangout: hangout} do
      conn = delete(conn, Routes.hangout_path(conn, :delete, hangout))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.hangout_path(conn, :show, hangout))
      end
    end
  end

  defp create_hangout(_) do
    hangout = fixture(:hangout)
    %{hangout: hangout}
  end
end
