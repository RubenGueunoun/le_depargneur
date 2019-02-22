class AddSommeToCagnotte < ActiveRecord::Migration[5.2]
  def change
    add_column :cagnottes, :somme, :float
  end
end
