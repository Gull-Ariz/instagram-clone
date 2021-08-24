class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story

  def initialize(user, story)
    @user = user
    @story = story
  end

  def index?
    return true
  end

  def create?
    user.present?
  end

  def update?
    verify_user_post
  end

  def show?
    (user.followeds.pluck(:user_id) << user.id).include? story.user.id
  end

  def destroy?
    verify_user_story
  end

  private

  def verify_user_story
    user.present? && user == story.user
  end
end
