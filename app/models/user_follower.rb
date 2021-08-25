# frozen_string_literal: true

class UserFollower < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: 'User'
end
