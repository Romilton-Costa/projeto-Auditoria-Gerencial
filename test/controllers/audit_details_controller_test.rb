require "test_helper"

class AuditDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audit_detail = audit_details(:one)
  end

  test "should get index" do
    get audit_details_url
    assert_response :success
  end

  test "should get new" do
    get new_audit_detail_url
    assert_response :success
  end

  test "should create audit_detail" do
    assert_difference("AuditDetail.count") do
      post audit_details_url, params: { audit_detail: { audit_result_id: @audit_detail.audit_result_id, metadata: @audit_detail.metadata, record_id: @audit_detail.record_id } }
    end

    assert_redirected_to audit_detail_url(AuditDetail.last)
  end

  test "should show audit_detail" do
    get audit_detail_url(@audit_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_audit_detail_url(@audit_detail)
    assert_response :success
  end

  test "should update audit_detail" do
    patch audit_detail_url(@audit_detail), params: { audit_detail: { audit_result_id: @audit_detail.audit_result_id, metadata: @audit_detail.metadata, record_id: @audit_detail.record_id } }
    assert_redirected_to audit_detail_url(@audit_detail)
  end

  test "should destroy audit_detail" do
    assert_difference("AuditDetail.count", -1) do
      delete audit_detail_url(@audit_detail)
    end

    assert_redirected_to audit_details_url
  end
end
