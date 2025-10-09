require "test_helper"

class PersonasControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get personas_create_url
    assert_response :success
  end
end
