require 'test_helper'

class RecommendspotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recommendspots_index_url
    assert_response :success
  end

end
