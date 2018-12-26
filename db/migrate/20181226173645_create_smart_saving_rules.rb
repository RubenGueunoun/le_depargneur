class CreateSmartSavingRules < ActiveRecord::Migration[5.2]
  def change
    create_table :smart_saving_rules do |t|
      t.string :nom
      t.string :type
      t.string :mecanisme

      t.timestamps
    end
  end
end
