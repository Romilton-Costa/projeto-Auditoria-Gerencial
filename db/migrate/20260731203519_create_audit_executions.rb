class CreateAuditExecutions < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_executions do |t|
      t.references :client, null: false, foreign_key: true
      t.datetime :executed_at

      t.timestamps
    end
  end
end
