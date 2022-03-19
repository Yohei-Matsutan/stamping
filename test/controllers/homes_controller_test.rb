require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get homes_top_url
    assert_response :success
  end

  test "should get admin_top" do
    get homes_admin_top_url
    assert_response :success
  end

  test "should get admin_certificate" do
    get homes_admin_certificate_url
    assert_response :success
  end
end
