require "test_helper"

class StampsControllerTest < ActionDispatch::IntegrationTest
  test "should get clock_on" do
    get stamps_clock_on_url
    assert_response :success
  end

  test "should get clock_out" do
    get stamps_clock_out_url
    assert_response :success
  end

  test "should get edit" do
    get stamps_edit_url
    assert_response :success
  end

  test "should get update" do
    get stamps_update_url
    assert_response :success
  end
end
