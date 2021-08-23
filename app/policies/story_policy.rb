class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story

  def initialize(user, story)
    @user = user
    @story = story
  end

  def index?
    veify_story_for_followers
  end

  def create?
    user.present?
  end

  def update?
    verify_user_post
  end

  def show?
    veify_story_for_followers
  end

  def destroy?
    verify_user_story
  end

  private

  def verify_user_story
    user.present? && user == story.user
  end

  def veify_story_for_followers
    followers = User.all - current_user.followeds - [current_user]
    followers.include? user.id || story.user == user
end
