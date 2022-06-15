require "test_helper"

class Public::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get public_homes_controller_url
    assert_response :success
  end
end
