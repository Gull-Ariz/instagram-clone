# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    @user.present?
  end

  def show?
    @user.present?
  end

  def update?
    verify_comment_user
  end

  def destroy?
    verify_comment_user
  end

  private

  def verify_comment_user
    @user.present? && @user == @record.user
  end
end
