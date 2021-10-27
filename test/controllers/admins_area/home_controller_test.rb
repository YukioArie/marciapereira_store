require "test_helper"

class AdminsArea::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_area_home_index_url
    assert_response :success
  end
end
