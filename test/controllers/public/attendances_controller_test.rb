require "test_helper"

class Public::AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_attendances_index_url
    assert_response :success
  end
end
