# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :can_authorize, only: %i[show edit update destroy]

  def index
    @posts = posts.order('created_at DESC').page(params[:page]).per(6)
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = current_user.posts.new(post_params)
    authorize @post
    if @post.save
      flash.alert = 'Post created successfully.'
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in creating Post'
      render 'new'
    end
  end

  def show; end

  def edit
    byebug
  end

  def update
    @image = @post.images.where(id: params[:image_id])
    if @image.present?
      @post.images.find(params[:image_id]).purge
      redirect_back(fallback_location: edit_post_path)
    else
      if @post.update(post_params)
        flash.alert = 'Post updated successfully.'
        redirect_to authenticated_root_path
      else
        flash.alert = 'Error in updating post'
        render 'edit'
      end
    end
  end

  def destroy
    flash.alert = if @post.destroy
                    'Post deleted successfully.'
                  else
                    'Error in deleting.'
                  end
    redirect_to authenticated_root_path
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

  def posts
    @posts = Post.includes([:comments, :likes]).where(user_id: current_user.accepted_followeds << current_user.id)
  end
end
