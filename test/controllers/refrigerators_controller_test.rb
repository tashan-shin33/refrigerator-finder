require "test_helper"

class RefrigeratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get refrigerators_index_url
    assert_response :success
  end

  test "should get new" do
    get refrigerators_new_url
    assert_response :success
  end
end
