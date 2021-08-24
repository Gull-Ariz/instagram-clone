class AccountController < ApplicationController

  def home_page
    @follower_suggestions=User.all
    @posts=Post.all
    @comment=Comment.new
    @like=Like.new
  end

  def profile
    @followers_suggestions = User.all
  end

  def follow_user
    @user = User.find(params[:user_id])
    if @user.account_type_private
      if current_user.followeds.create(user_id: params[:user_id], accepted: false)
        redirect_to authenticated_root_path
      else
        flash[:danger] = 'unable to add follower'
      end
    else
      if current_user.followeds.create(user_id: params[:user_id], accepted: true)
        redirect_to authenticated_root_path
      else
        flash[:danger] = 'Unable to add follower'
      end
    end
  end

  def unfollow_user
    follower_id = params[:follower_id]
    if current_user.followeds.find_by(user_id: params[:user_id]).destroy
      flash[:success] = 'Successfully Unfollow'
    else
      flash[:danger] = 'Unable to unfollow'
    end
    redirect_to authenticated_root_path
  end

  def accept_request
    request = UserFollower.find_by(user_id: params[:user_id])
    request.update(accepted: true)
    byebug
    redirect_to authenticated_root_path
    # if request.accepted = true
    #   flash[:success] = 'request accepted.'
    # else
    #   flash.alert = 'Error in accepting request.'
    # end
  end

end
