class AddBielementsToOperations < ActiveRecord::Migration[5.2]
  def change
    add_column :operations, :bi_id, :integer
    add_column :operations, :arrondi, :integer
  end
end
