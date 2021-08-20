class UsersController < ApplicationController
  before_action :set_user, only: [:profile]

  def profile
  end

  def follow_user
    if current_user.followeds.create(user_id: params[:user_id])
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
