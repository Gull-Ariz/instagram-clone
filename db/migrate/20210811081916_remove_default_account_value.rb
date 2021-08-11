class RemoveDefaultAccountValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :account_type_private, nil)
  end
end
