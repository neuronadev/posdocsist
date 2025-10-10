require "test_helper"

class FinalizadosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get finalizados_new_url
    assert_response :success
  end

  test "should get create" do
    get finalizados_create_url
    assert_response :success
  end
end
