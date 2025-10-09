require "test_helper"

class EstanciasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get estancias_index_url
    assert_response :success
  end
end
