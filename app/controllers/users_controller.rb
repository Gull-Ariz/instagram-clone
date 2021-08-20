class UsersController < ApplicationController
  before_action :set_user, only: [:profile]

  def home_page
    @follower_suggestions = User.where.not(id: current_user.id)
    @posts = Post.all
    @users = User.all.joins(:stories).where.not(stories: {id: nil})
  end

  def profile
    @followers_suggestions = User.all
  end

  def follow_user
    if current_user.followeds.create(user_id: params[:user_id])
      @follower_suggestions = User.where.not(id: current_user.id)
      flash[:success] = "Now Following User"
      respond_to do |format|
        format.html { redirect_to authenticated_root_path }
        format.js
      end
    else
      flash[:danger] = "Unable to add follower"
    end
  end

  def unfollow_user
    if current_user.followeds.find_by(user_id: params[:user_id]).destroy
      @follower_suggestions = User.where.not(id: current_user.id)
      flash[:success] = "Successfully Unfollow"
      respond_to do |format|
        format.html { redirect_to authenticated_root_path }
        format.js
      end
    else
      flash[:danger] = "Unable to unfollow"
    end
  end

  private
  def set_user
    @user = User.find( params[:id] )
  end
end
