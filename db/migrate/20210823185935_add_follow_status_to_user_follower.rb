class AddFollowStatusToUserFollower < ActiveRecord::Migration[5.2]
  def change
    add_column :user_followers, :accepted, :boolean
  end
end
