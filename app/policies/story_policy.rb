# frozen_string_literal: true

class StoryPolicy < ApplicationPolicy

  def create?
    @user.present?
  end

  def show?
    (@user.id == @record.user_id) || @record.user.followeds.where(followed_id: @user.id).present?
  end

  def destroy?
    @user.present? && user == @record.user
  end

end
