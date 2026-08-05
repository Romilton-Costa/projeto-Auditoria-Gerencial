class CreateAuditResults < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_results do |t|
      t.references :audit_execution, null: false, foreign_key: true
      t.references :audit_rule, null: false, foreign_key: true
      t.integer :total_found

      t.timestamps
    end
  end
end
