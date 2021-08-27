# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    authorize @comment
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      flash.alert = 'Error in commenting.'
      format.js
    end
  end

  def edit
    @post = Post.find_by(params[:post_id])
    render 'edit'
  end

  def update
    authorize @comment
    if @comment.update(comment_params)
      flash.alert = 'Updated successfully.'
      redirect_to authenticated_root_path
    else
      flash.alert = 'Something Went Wrong.'
      render 'edit'
    end
  end

  def destroy
    authorize @comment
    if @comment.destroy
      respond_to do |format|
        format.js
      end
    else
      flash.alert = 'Something Went Wrong.'
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
