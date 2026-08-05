require "test_helper"

class SemAndamentosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sem_andamentos_index_url
    assert_response :success
  end
end
