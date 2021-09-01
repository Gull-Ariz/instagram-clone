class PostPolicy < ApplicationPolicy

  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def create?
    user.present?
  end

  def show?
    (user.followers.pluck(:user_id) << user.id).include? post.user.id
  end

  def update?
    verify_user_post
  end

  def destroy?
    verify_user_post
  end

  private

  def verify_user_post
    user.present? && user == post.user
  end
end
