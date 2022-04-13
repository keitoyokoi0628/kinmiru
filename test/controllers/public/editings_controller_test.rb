require "test_helper"

class Public::EditingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_editings_new_url
    assert_response :success
  end

  test "should get confirm" do
    get public_editings_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get public_editings_complete_url
    assert_response :success
  end
end
