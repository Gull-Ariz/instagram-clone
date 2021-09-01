# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def create
    @like = current_user.likes.new(like_params)
    authorize @like
    if @like.save
      respond_to do |format|
        format.js
      end
    else
      flash.alert = 'Something went wrong.'
    end
  end

  def destroy
    authorize @like
    if @like.destroy
      respond_to do |format|
        format.js
      end
    else
      flash.alert = 'Something went wrong.'
    end
  end

  private

  def like_params
    params.permit :post_id
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
