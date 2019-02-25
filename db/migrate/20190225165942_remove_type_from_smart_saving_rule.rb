class RemoveTypeFromSmartSavingRule < ActiveRecord::Migration[5.2]
  def change
    remove_column :smart_saving_rules, :type, :string
  end
end
