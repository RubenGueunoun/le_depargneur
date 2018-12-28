class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :messenger_id, :integer
    add_column :users, :profil_depargneur, :string
  end
end
