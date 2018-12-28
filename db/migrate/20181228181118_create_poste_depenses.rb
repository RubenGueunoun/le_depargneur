class CreatePosteDepenses < ActiveRecord::Migration[5.2]
  def change
    create_table :poste_depenses do |t|
      t.string :categorie
      t.integer :montant
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
