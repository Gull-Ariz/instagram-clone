class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story

  def initialize(user, story)
    @user = user
    @story = story
  end

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == story.user
  end

  def show?
    return true
  end

  def destroy?
    return true if user.present? && user == story.user
  end

end
