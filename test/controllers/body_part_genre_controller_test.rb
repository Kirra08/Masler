require "test_helper"

class BodyPartGenreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get body_part_genre_index_url
    assert_response :success
  end

  test "should get edit" do
    get body_part_genre_edit_url
    assert_response :success
  end
end
