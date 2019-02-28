class CreateEpargnes < ActiveRecord::Migration[5.2]
  def change
    create_table :epargnes do |t|
      t.references :user, foreign_key: true
      t.references :smart_saving_rule, foreign_key: true
      t.timestamps
    end
  end
end
