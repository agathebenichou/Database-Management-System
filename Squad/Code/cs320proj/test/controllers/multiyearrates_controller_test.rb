require 'test_helper'

class MultiyearratesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get multiyearrates_index_url
    assert_response :success
  end

  test "should get show" do
    get multiyearrates_show_url
    assert_response :success
  end

end
