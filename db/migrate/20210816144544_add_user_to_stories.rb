# frozen_string_literal: true

class AddUserToStories < ActiveRecord::Migration[5.2]
  def change
    add_reference :stories, :user, foreign_key: true
  end
end
