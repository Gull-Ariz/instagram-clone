# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    if @like.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
