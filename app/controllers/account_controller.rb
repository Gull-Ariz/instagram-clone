class AccountController < ApplicationController

  def home_page
    @follower_suggestions = User.all
    @posts = Post.all
  end

  def profile
    @followers_suggestions = User.all
  end

  def follow_user
    follower_id = params[:follower_id]
    if current_user.followers.create(follower_id: follower_id)
      flash[:success] = "Now Following User"
    else
      flash[:danger] = "Unable to add follower"
    end
    redirect_to authenticated_root_path
  end
  def unfollow_user
    follower_id = params[:follower_id]
    if current_user.followers.find_by(follower_id: follower_id).destroy
      flash[:success] = "Successfully Unfollow"
    else
      flash[:danger] = "Unable to unfollow"
    end
    redirect_to authenticated_root_path
  end

end
