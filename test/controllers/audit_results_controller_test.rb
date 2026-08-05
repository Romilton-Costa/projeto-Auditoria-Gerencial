require "test_helper"

class AuditResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audit_result = audit_results(:one)
  end

  test "should get index" do
    get audit_results_url
    assert_response :success
  end

  test "should get new" do
    get new_audit_result_url
    assert_response :success
  end

  test "should create audit_result" do
    assert_difference("AuditResult.count") do
      post audit_results_url, params: { audit_result: { audit_execution_id: @audit_result.audit_execution_id, audit_rule_id: @audit_result.audit_rule_id, total_found: @audit_result.total_found } }
    end

    assert_redirected_to audit_result_url(AuditResult.last)
  end

  test "should show audit_result" do
    get audit_result_url(@audit_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_audit_result_url(@audit_result)
    assert_response :success
  end

  test "should update audit_result" do
    patch audit_result_url(@audit_result), params: { audit_result: { audit_execution_id: @audit_result.audit_execution_id, audit_rule_id: @audit_result.audit_rule_id, total_found: @audit_result.total_found } }
    assert_redirected_to audit_result_url(@audit_result)
  end

  test "should destroy audit_result" do
    assert_difference("AuditResult.count", -1) do
      delete audit_result_url(@audit_result)
    end

    assert_redirected_to audit_results_url
  end
end
