# frozen_string_literal: true

class StoryPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    @user.present?
  end

  def update?
    verify_user_post
  end

  def show?
    (@user.followeds.pluck(:user_id) << @user.id).include? @record.user.id
  end

  def destroy?
    verify_user_story
  end

  private

  def verify_user_story
    @user.present? && user == @record.user
  end
end
