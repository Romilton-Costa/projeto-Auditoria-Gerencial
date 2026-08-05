require "test_helper"

class AuditExecutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audit_execution = audit_executions(:one)
  end

  test "should get index" do
    get audit_executions_url
    assert_response :success
  end

  test "should get new" do
    get new_audit_execution_url
    assert_response :success
  end

  test "should create audit_execution" do
    assert_difference("AuditExecution.count") do
      post audit_executions_url, params: { audit_execution: { client_id: @audit_execution.client_id, executed_at: @audit_execution.executed_at } }
    end

    assert_redirected_to audit_execution_url(AuditExecution.last)
  end

  test "should show audit_execution" do
    get audit_execution_url(@audit_execution)
    assert_response :success
  end

  test "should get edit" do
    get edit_audit_execution_url(@audit_execution)
    assert_response :success
  end

  test "should update audit_execution" do
    patch audit_execution_url(@audit_execution), params: { audit_execution: { client_id: @audit_execution.client_id, executed_at: @audit_execution.executed_at } }
    assert_redirected_to audit_execution_url(@audit_execution)
  end

  test "should destroy audit_execution" do
    assert_difference("AuditExecution.count", -1) do
      delete audit_execution_url(@audit_execution)
    end

    assert_redirected_to audit_executions_url
  end
end
