# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show; end

  def follow
    user = User.find(params[:id])
    if user.account_type_private
      if current_user.followeds.create(followed_id: params[:id], accepted: false)
        respond_to do |format|
          format.js
        end
      end
    elsif current_user.followeds.create(followed_id: params[:id], accepted: true)
      respond_to do |format|
        format.js
      end
    end
  end

  def index
    @users = User.search(params[:term])
    respond_to do |format|
      format.js
    end
  end

  def unfollow
    if current_user.followeds.find_by(followed_id: params[:id]).destroy
      respond_to do |format|
        format.js
      end
    else
      flash.alert = 'Unable to unfollow'
      format.js
    end
  end

  def accept_request
    request = UserFollower.find_by(follower_id: params[:follower_id])
    ActiveRecord::Base.transaction do
      if request.update!(accepted: true) && set_followeds
        respond_to do |format|
          format.js
        end
      else
        flash.alert = 'Something went wrong.'
        format.js
      end
    rescue ActiveRecord::Exception
      flash.alert = 'Something went wrong.'
      redirect_to(:back)
    end
  end

  def followers; end

  def followeds; end

  private

  def set_followeds
    current_user.followeds.create!(followed_id: params[:id], accepted: true)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
