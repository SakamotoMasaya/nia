require 'test_helper'

class BuyRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buy_request_index_url
    assert_response :success
  end

  test "should get create" do
    get buy_request_create_url
    assert_response :success
  end

end
