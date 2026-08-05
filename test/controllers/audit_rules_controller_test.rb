require "test_helper"

class AuditRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audit_rule = audit_rules(:one)
  end

  test "should get index" do
    get audit_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_audit_rule_url
    assert_response :success
  end

  test "should create audit_rule" do
    assert_difference("AuditRule.count") do
      post audit_rules_url, params: { audit_rule: { description: @audit_rule.description, name: @audit_rule.name, severity: @audit_rule.severity } }
    end

    assert_redirected_to audit_rule_url(AuditRule.last)
  end

  test "should show audit_rule" do
    get audit_rule_url(@audit_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_audit_rule_url(@audit_rule)
    assert_response :success
  end

  test "should update audit_rule" do
    patch audit_rule_url(@audit_rule), params: { audit_rule: { description: @audit_rule.description, name: @audit_rule.name, severity: @audit_rule.severity } }
    assert_redirected_to audit_rule_url(@audit_rule)
  end

  test "should destroy audit_rule" do
    assert_difference("AuditRule.count", -1) do
      delete audit_rule_url(@audit_rule)
    end

    assert_redirected_to audit_rules_url
  end
end
