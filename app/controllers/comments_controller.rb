class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in commenting.'
      redirect_to authenticated_root_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to authenticated_root_path
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to authenticated_root_path
  end

  private
    def comment_params
      params.require(:comment).permit( :content, :post_id )
    end
end
