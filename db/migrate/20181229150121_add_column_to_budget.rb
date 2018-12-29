class AddColumnToBudget < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :revenu, :string
  end
end
