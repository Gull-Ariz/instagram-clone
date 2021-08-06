class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.images.length <= 10
      @post.user_id = current_user.id

      if @post.save
        redirect_to @post
      else
        render 'new'
      end
    else
      @post.errors.add(:base, "Post cannot contain more than 10 images")
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:description, images: [])
    end
end
