require 'test_helper'

class MypagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get mypages_top_url
    assert_response :success
  end

end
