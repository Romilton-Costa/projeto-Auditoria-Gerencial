require "test_helper"

class SemPassosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sem_passos_index_url
    assert_response :success
  end
end
