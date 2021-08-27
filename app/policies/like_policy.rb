class LikePolicy < ApplicationPolicy

  def create?
    verify_like_user
  end

  def destroy?
    verify_like_user
  end

  private

  def verify_comment_user?
    (@user.id == @record.post.user_id) || (@record.post.user.followeds.where(follower_id: @user.id)).present?
  end

end
