require "test_helper"

class AdminsArea::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_area_products_index_url
    assert_response :success
  end
end
