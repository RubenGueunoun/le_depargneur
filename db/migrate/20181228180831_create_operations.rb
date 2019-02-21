class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.datetime :date
      t.string :categorie
      t.string :libelle
      t.float :montant
      t.references :compte_bancaire, foreign_key: true

      t.timestamps
    end
  end
end
