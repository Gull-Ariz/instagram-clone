class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :delete_image_attachment]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash.alert = 'Post created successfully.'
      redirect_to authenticated_root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash.alert = 'Post updated successfully.'
      redirect_to authenticated_root_path
    else
      redirect_to posts_path
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def delete_image_attachment
    @post = Post.find(params[:post_id])
    @image = @post.images.find(params[:image_id])
    @image.purge
    redirect_back(fallback_location: posts_path)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:description, images: [])
    end
end
