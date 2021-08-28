# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy

  def create?
    verify_comment_user?
  end

  def show?
    verify_comment_user?
  end

  def update?
    @user.id == @record.post.user_id
  end

  def destroy?
    verify_comment_user?
  end

  private

  def verify_comment_user?
    (@user.id == @record.post.user_id) || (@record.post.user.followeds.where(user_id: @user.id)).present?
  end

end
