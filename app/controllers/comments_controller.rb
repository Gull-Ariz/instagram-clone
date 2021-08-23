class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.js
      end
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in commenting.'
      redirect_to authenticated_root_path
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to authenticated_root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.js
      end
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in deleting comment.'
      redirect_to authenticated_root_path
    end
  end

  private
    def comment_params
      params.require(:comment).permit( :content, :post_id )
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
