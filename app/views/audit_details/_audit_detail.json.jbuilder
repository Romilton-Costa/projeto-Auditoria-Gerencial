json.extract! audit_detail, :id, :audit_result_id, :record_id, :metadata, :created_at, :updated_at
json.url audit_detail_url(audit_detail, format: :json)
