# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    @user.present?
  end

  def show?
    (@user.followers.pluck(:user_id) << @user.id).include? @record.user.id
  end

  def update?
    verify_user_post
  end

  def destroy?
    verify_user_post
  end

  private

  def verify_user_post
    @user.present? && @user == @record.user
  end
end
