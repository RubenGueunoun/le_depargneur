class AddColumnToCagnotte < ActiveRecord::Migration[5.2]
  def change
    add_column :cagnottes, :genre, :string
  end
end
