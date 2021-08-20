class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story

  def initialize(user, story)
    @user = user
    @story = story
  end

  def index?
    # user_followerss = UserFollower.all
    # follower_ids = @user.followers.map{|fid| fid['follower_id']}
    # follower_ids.map{|fid| fid['follower_id']}.include? @story.user_id || verify_user_story
    return false
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
    user.present? && user == story.user
  end
end
