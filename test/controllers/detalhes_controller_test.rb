require "test_helper"

class DetalhesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get detalhes_index_url
    assert_response :success
  end
end
