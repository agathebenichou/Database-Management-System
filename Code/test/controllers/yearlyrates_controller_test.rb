require 'test_helper'

class YearlyratesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yearlyrates_index_url
    assert_response :success
  end

  test "should get show" do
    get yearlyrates_show_url
    assert_response :success
  end

end
