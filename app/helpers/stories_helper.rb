# frozen_string_literal: true

module StoriesHelper
  def stories
    Story.where(user_id: current_user.followeds.where(accepted: true).pluck(:user_id) << current_user.id)
  end
end
