require "test_helper"

class DuplicadosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get duplicados_index_url
    assert_response :success
  end
end
