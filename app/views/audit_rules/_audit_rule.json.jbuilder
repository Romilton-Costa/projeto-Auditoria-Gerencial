json.extract! audit_rule, :id, :name, :description, :severity, :created_at, :updated_at
json.url audit_rule_url(audit_rule, format: :json)
