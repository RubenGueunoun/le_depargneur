class AddBitokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bi_token, :string
  end
end
