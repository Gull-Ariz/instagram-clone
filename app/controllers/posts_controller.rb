class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.images.length <= 10
      if @post.save
        redirect_to @post
      else
        render 'new'
      end
    else
      @post.errors.add(:base, 'Post cannot contain more than 10 images')
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    post_obj_check_images=Post.new(post_params)
    if @post.images.length + post_obj_check_images.images.length <= 10
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    else
      @post.errors.add(:base, 'Post cannot contain more than 10 images')
      render 'edit'
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
    def find_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:description, images: [])
    end
end
