require "test_helper"

class GearGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gear_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get gear_genres_edit_url
    assert_response :success
  end
end
