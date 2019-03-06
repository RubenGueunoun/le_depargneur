class AddLocalisationToEpargne < ActiveRecord::Migration[5.2]
  def change
    add_column :epargnes, :localisation, :string
  end
end
