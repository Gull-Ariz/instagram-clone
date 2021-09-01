# frozen_string_literal: true

class LikePolicy < ApplicationPolicy
  def create?
    can_like?
  end

  def destroy?
    can_like?
  end

  private

  def can_like?
    (@user.id == @record.post.user_id) || @record.post.user.followers.where(follower_id: @user.id).present?
  end
end
