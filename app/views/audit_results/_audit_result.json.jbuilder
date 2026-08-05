json.extract! audit_result, :id, :audit_execution_id, :audit_rule_id, :total_found, :created_at, :updated_at
json.url audit_result_url(audit_result, format: :json)
