class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def follow
    if current_user.followeds.create(user_id: params[:id])
      respond_to do |format|
        format.html { redirect_to authenticated_root_path }
        format.js
      end
    else
      flash[:danger] = "Unable to add follower"
    end
  end

  def unfollow
    if current_user.followeds.find_by(user_id: params[:id]).destroy
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
