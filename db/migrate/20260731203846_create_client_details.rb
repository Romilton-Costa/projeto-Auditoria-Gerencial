class CreateClientDetails < ActiveRecord::Migration[8.1]
  def change
    create_table :client_details do |t|
      t.timestamps
    end
  end
end
