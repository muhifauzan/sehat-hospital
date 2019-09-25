defmodule SehatHospitalWeb.HospitalControllerTest do
  use SehatHospitalWeb.ConnCase

  alias SehatHospital.Admin

  @create_attrs %{address: "some address", name: "some name"}
  @update_attrs %{address: "some updated address", name: "some updated name"}
  @invalid_attrs %{address: nil, name: nil}

  def fixture(:hospital) do
    {:ok, hospital} = Admin.create_hospital(@create_attrs)
    hospital
  end

  describe "index" do
    test "lists all hospitals", %{conn: conn} do
      conn = get(conn, Routes.hospital_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Hospitals"
    end
  end

  describe "new hospital" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.hospital_path(conn, :new))
      assert html_response(conn, 200) =~ "New Hospital"
    end
  end

  describe "create hospital" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.hospital_path(conn, :create), hospital: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.hospital_path(conn, :show, id)

      conn = get(conn, Routes.hospital_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Hospital"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.hospital_path(conn, :create), hospital: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Hospital"
    end
  end

  describe "edit hospital" do
    setup [:create_hospital]

    test "renders form for editing chosen hospital", %{conn: conn, hospital: hospital} do
      conn = get(conn, Routes.hospital_path(conn, :edit, hospital))
      assert html_response(conn, 200) =~ "Edit Hospital"
    end
  end

  describe "update hospital" do
    setup [:create_hospital]

    test "redirects when data is valid", %{conn: conn, hospital: hospital} do
      conn = put(conn, Routes.hospital_path(conn, :update, hospital), hospital: @update_attrs)
      assert redirected_to(conn) == Routes.hospital_path(conn, :show, hospital)

      conn = get(conn, Routes.hospital_path(conn, :show, hospital))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, hospital: hospital} do
      conn = put(conn, Routes.hospital_path(conn, :update, hospital), hospital: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Hospital"
    end
  end

  describe "delete hospital" do
    setup [:create_hospital]

    test "deletes chosen hospital", %{conn: conn, hospital: hospital} do
      conn = delete(conn, Routes.hospital_path(conn, :delete, hospital))
      assert redirected_to(conn) == Routes.hospital_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.hospital_path(conn, :show, hospital))
      end
    end
  end

  defp create_hospital(_) do
    hospital = fixture(:hospital)
    {:ok, hospital: hospital}
  end
end
