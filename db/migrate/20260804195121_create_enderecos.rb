class CreateEnderecos < ActiveRecord::Migration[8.1]
  def change
    create_table :enderecos do |t|
      t.string :cliente
      t.string :cidade
      t.string :estado
      t.string :cep
      t.string :status

      t.timestamps
    end
  end
end
