# frozen_string_literal: true

module UsersHelper
  def follow_suggestions
    User.where.not(id: current_user.followeds.pluck(:followed_id) << current_user.id)
  end

  def follow_requests
    UserFollower.where(followed_id: current_user.id, accepted: false)
  end

  def followers
    UserFollower.where(followed_id: current_user.id, accepted: true)
  end

  def followeds
    UserFollower.where(follower_id: current_user.id, accepted: true)
  end
end
