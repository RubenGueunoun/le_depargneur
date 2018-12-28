class CreateCompteBancaires < ActiveRecord::Migration[5.2]
  def change
    create_table :compte_bancaires do |t|
      t.string :nom_banque
      t.string :numero_compte
      t.string :code_acces
      t.string :sepa
      t.string :rib
      t.integer :solde
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
