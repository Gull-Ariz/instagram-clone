module UsersHelper
  def follow_suggestions
    User.where.not(id: current_user.followeds.pluck(:user_id) << current_user.id)
  end
end
