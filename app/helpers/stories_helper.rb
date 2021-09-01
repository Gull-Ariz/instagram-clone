module StoriesHelper
  def stories
    Story.where(user_id: current_user.followeds.pluck(:user_id) << current_user.id)
  end
end
