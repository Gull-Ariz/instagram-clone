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
    true
  end

  def update?
    return true if user.present? && user == post.user
  end

  def destroy?
    return true if user.present? && user == post.user
  end

end
