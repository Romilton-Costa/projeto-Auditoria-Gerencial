require "test_helper"

class PeticionadosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get peticionados_index_url
    assert_response :success
  end
end
