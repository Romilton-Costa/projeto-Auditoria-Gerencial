class CreateAuditDetails < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_details do |t|
      t.references :audit_result, null: false, foreign_key: true
      t.string :record_id
      t.jsonb :metadata

      t.timestamps
    end
  end
end
