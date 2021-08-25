# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show; end

  def follow
    user = User.find(params[:id])
    if user.account_type_private
      if current_user.followeds.create(user_id: params[:id], accepted: false)
        respond_to do |format|
          format.html { redirect_to authenticated_root_path }
          format.js
        end
      end
    elsif current_user.followeds.create(user_id: params[:id], accepted: true)
      respond_to do |format|
        format.js
      end
    end
  end

  def unfollow
    if current_user.followeds.find_by(user_id: params[:id]).destroy
      current_user.followers.find_by(user_id: params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to authenticated_root_path }
        format.js
      end
    else
      flash[:danger] = 'Unable to unfollow'
    end
  end

  def accept_request
    request = UserFollower.find_by(user_id: params[:user_id])
    if request.update(accepted: true)
      current_user.followeds.create(user_id: params[:id], accepted: true)
      respond_to do |format|
        format.js
      end
    end
  end

  def followers
  end

  def followeds
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
