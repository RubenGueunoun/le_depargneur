class AddLastupdateToCompteBancaire < ActiveRecord::Migration[5.2]
  def change
    add_column :compte_bancaires, :last_update, :datetime
  end
end
