class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :messenger_id, :integer
    add_column :users, :compte_bancaire, :string
    add_column :users, :rib, :string
    add_column :users, :sepa, :string
    add_column :users, :profil_depargneur, :string
    add_column :users, :budget, :string
  end
end
