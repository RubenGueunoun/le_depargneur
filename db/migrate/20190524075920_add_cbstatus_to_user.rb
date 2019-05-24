class AddCbstatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cb_status, :string
  end
end
