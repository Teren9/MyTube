require 'test_helper'

class VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get new" do
    get new_video_path
    assert_response :success
  end

  test "should get create" do
  end

  test "should get update" do
  end

  test "should get destroy" do
  end

end
