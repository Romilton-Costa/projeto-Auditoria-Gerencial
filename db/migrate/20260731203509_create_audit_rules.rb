class CreateAuditRules < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_rules do |t|
      t.string :name
      t.text :description
      t.string :severity

      t.timestamps
    end
  end
end
