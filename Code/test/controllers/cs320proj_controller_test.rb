require 'test_helper'

class Cs320projControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cs320proj_index_url
    assert_response :success
  end

end
