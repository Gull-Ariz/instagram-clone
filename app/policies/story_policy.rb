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
    verify_user_post
  end

  def show?
    return true
  end

  def destroy?
    verify_user_story
  end

  private

  def verify_user_story
    return true if user.present? && user == story.user
  end
end
