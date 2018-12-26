class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.boolean :retrait
      t.integer :montant
      t.boolean :automatique
      t.references :cagnotte, foreign_key: true

      t.timestamps
    end
  end
end
