require "test_helper"

class AdminsArea::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_area_order_details_index_url
    assert_response :success
  end
end
