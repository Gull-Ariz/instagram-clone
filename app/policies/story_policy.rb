class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story

  def initialize(user, story)
    @user = user
    @story = story
  end

  def index?
    followers = User.all - current_user.followeds - [current_user]
    if followers.include? user.id || story.user == user
      return true
    else
      return false
    end
  end

  def create?
    user.present?
  end

  def update?
    verify_user_post
  end

  def show?
    followers = User.all - current_user.followeds - [current_user]
    if followers.include? user.id || story.user == user
      return true
    else
      return false
    end
  end

  def destroy?
    verify_user_story
  end

  private

  def verify_user_story
    user.present? && user == story.user
  end
end
