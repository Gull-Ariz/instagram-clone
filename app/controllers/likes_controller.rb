class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      respond_to do |format|
        format.js
      end
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in like a post.'
      redirect_to authenticated_root_path
    end
  end

  def destroy
    if @like.destroy
      respond_to do |format|
        format.js
      end
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in disliking.'
      redirect_to authenticated_root_path
    end
  end

  private
    def like_params
      params.require(:like).permit( :post_id )
    end

    def set_like
      @like = Like.find(params[:id])
    end
end
