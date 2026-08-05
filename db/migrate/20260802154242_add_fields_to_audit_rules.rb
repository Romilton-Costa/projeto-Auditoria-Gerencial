class AddFieldsToAuditRules < ActiveRecord::Migration[8.1]
  def change
    add_column :audit_rules, :category, :string
    add_column :audit_rules, :sql_query, :text
    add_column :audit_rules, :active, :boolean, default: true
    add_column :audit_rules, :icon, :string
    add_column :audit_rules, :color, :string
  end
end
