class AddColumnToCompteBancaire < ActiveRecord::Migration[5.2]
  def change
    add_column :compte_bancaires, :rythme, :integer
  end
end
