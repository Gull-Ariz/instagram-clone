class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :delete_image_attachment]
  before_action :can_authorize, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash.alert = 'Post created successfully.'
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in creating Post'
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
      flash.alert = 'Error in updating post'
      redirect_to posts_path
    end
  end

  def destroy
    @post.destroy
    flash.alert = 'Post deleted successfully.'
    redirect_to posts_path
  end

  def delete_image_attachment
    @image = @post.images.find(params[:image_id])
    @image.purge
    redirect_back(fallback_location: posts_path)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def can_authorize
      authorize @post
    end

    def post_params
      params.require(:post).permit(:description, images: [])
    end

end
