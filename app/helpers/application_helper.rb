module ApplicationHelper
  def followers_suggestion
    User.where.not(id: current_user.followeds.pluck(:user_id) << current_user.id)
  end
end
