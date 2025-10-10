require "test_helper"

class ValidacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get validaciones_index_url
    assert_response :success
  end
end
