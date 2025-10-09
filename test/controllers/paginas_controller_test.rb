require "test_helper"

class PaginasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get paginas_index_url
    assert_response :success
  end
end
