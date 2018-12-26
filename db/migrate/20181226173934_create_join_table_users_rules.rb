class CreateJoinTableUsersRules < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :smart_saving_rules
  end
end
