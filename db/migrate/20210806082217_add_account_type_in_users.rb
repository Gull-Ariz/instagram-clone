class AddAccountTypeInUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :account_type_private, :boolean
  end
end
