# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :set_story, only: %i[show destroy]
  before_action :can_authorize, only: %i[show destroy]

  def index
    @stories = stories.page(params[:page]).per(1)
  end

  def new
    @story = Story.new
    authorize @story
  end

  def create
    @story = current_user.stories.new(story_params)
    authorize @story
    if @story.save
      flash.alert = 'Story created successfully.'
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in creating Story'
      render 'new'
    end
  end

  def show; end

  def destroy
    if @story.destroy
      flash.alert = 'Story deleted.'
    else
      flash.alert = 'Unable to delete story.'
    end
    redirect_to authenticated_root_path
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def can_authorize
    authorize @story
  end

  def story_params
    params.require(:story).permit(images: [])
  end

  def stories
    Story.where(user_id: current_user.followeds.where(accepted: true).pluck(:user_id) << current_user.id)
  end
end
