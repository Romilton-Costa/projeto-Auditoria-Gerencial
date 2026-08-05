require "test_helper"

class InfraestruturasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infraestruturas_index_url
    assert_response :success
  end
end
