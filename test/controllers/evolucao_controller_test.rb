require "test_helper"

class EvolucaoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evolucao_index_url
    assert_response :success
  end
end
