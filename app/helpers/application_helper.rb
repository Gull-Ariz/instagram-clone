module ApplicationHelper
  def followers_suggestion_collection
    User.where.not(id: current_user.followeds.pluck(:user_id) << current_user.id)
  end
end
