class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    if @like.save
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in like a post.'
      redirect_to authenticated_root_path
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    redirect_to authenticated_root_path
  end

  private
    def like_params
      params.require(:like).permit( :post_id )
    end
end
