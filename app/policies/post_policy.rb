# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    @user.present?
  end

  def show?
    (@user.id == @record.user_id) || @record.user.followeds.where(followed_id: @user.id).present?
  end

  def update?
    own_post?
  end

  def destroy?
    own_post?
  end

  private

  def own_post?
    @user.present? && @user == @record.user
  end
end
