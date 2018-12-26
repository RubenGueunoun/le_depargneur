class CreateCagnottes < ActiveRecord::Migration[5.2]
  def change
    create_table :cagnottes do |t|
      t.datetime :date
      t.integer :montant
      t.string :objectif
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
