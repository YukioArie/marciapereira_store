require "test_helper"

class AdminsArea::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_area_clients_index_url
    assert_response :success
  end
end
