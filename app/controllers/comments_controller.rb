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

  private
    def comment_params
      params.require(:comment).permit( :content, :post_id )
    end
end
