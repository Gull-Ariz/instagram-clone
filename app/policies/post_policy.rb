# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    @user.present?
  end

  def show?
    # FIX THIS
    (@user.followeds.where(accepted: true).pluck(:user_id) << @user.id).include? @record.user.id
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
