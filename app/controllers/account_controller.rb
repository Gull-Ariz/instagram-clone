class AccountController < ApplicationController

  def home_page
    @follower_suggestions = User.all
    @posts = Post.all
  end
  def profile
    @followers_suggestions = User.all
  end
end
