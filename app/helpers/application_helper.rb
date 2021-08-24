module ApplicationHelper
  def get_collection type
    type.where.not(id: current_user.followeds.pluck(:user_id) << current_user.id)
  end
end
