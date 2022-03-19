require "test_helper"

class EditLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get edit_logs_new_url
    assert_response :success
  end

  test "should get create" do
    get edit_logs_create_url
    assert_response :success
  end
end
