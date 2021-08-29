# frozen_string_literal: true

class CreateUserFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_followers do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end
    add_index :user_followers, :follower_id
    add_index :user_followers, :followed_id
  end
end
