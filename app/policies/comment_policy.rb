# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def create?
    verify_comment_user?
  end

  def show?
    verify_comment_user?
  end

  def update?
    @user.id == @record.user_id
  end

  def destroy?
    @user.id == @record.post.user_id || @user.id == @record.user_id

  end

  private

  def verify_comment_user?
    (@user.id == @record.post.user_id) || @record.post.user.followers.where(follower_id: @user.id).present?
  end
end
