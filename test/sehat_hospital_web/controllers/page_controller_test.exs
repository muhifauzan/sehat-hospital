defmodule SehatHospitalWeb.PageControllerTest do
  use SehatHospitalWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
