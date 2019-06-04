class RemoveColumnsToCompteBancaire < ActiveRecord::Migration[5.2]
  def change
    remove_column :compte_bancaires, :code_acces, :string
    remove_column :compte_bancaires, :sepa, :string
    remove_column :compte_bancaires, :rib, :string
    add_column :compte_bancaires, :iban, :string
    add_column :compte_bancaires, :nom, :string
    add_column :compte_bancaires, :statut, :string
  end
end
