require 'test_helper'

class BrightIdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bright_ideas_index_url
    assert_response :success
  end

  test "should get create" do
    get bright_ideas_create_url
    assert_response :success
  end

  test "should get show" do
    get bright_ideas_show_url
    assert_response :success
  end

  test "should get edit" do
    get bright_ideas_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get bright_ideas_destroy_url
    assert_response :success
  end

end
