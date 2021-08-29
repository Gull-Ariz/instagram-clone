# frozen_string_literal: true

module StoriesHelper
  def stories
    Story.where(user_id: current_user.accepted_followeds << current_user.id)
  end
end
