class AddNiveauToSmartSavingRule < ActiveRecord::Migration[5.2]
  def change
    add_column :smart_saving_rules, :niveau, :string
  end
end
