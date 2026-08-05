require "test_helper"

class CaixafuncaoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get caixafuncao_index_url
    assert_response :success
  end
end
