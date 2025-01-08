require "test_helper"

class UnsubscribesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get unsubscribes_show_url
    assert_response :success
  end
end
