# frozen_string_literal: true

class AddUserToStoriesAndIndexing < ActiveRecord::Migration[5.2]
  def change
    add_reference :stories, :user, foreign_key: true
    add_index :stories, :created_at
  end
end
