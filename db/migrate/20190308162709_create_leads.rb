class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.bigint :messenger_id
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :status
      t.string :token
      t.boolean :inscrit

      t.timestamps
    end
  end
end
