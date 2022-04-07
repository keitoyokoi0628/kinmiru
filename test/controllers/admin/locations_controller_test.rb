require "test_helper"

class Admin::LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_locations_index_url
    assert_response :success
  end
end
