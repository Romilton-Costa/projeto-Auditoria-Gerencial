class AuditResult < ApplicationRecord
  belongs_to :audit_execution
  belongs_to :audit_rule
end
