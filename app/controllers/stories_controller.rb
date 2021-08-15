class StoriesController < ApplicationController

  before_action :set_story, only: [:show, :destroy]

  def index
    @stories = Story.all
  end

  def new
    @story = current_user.Story.new
  end

  def create
    @story = current_user.stories.new(story_params)
    if @story.save
      redirect_to @story
    else
      render 'new'
    end
  end

  def show

  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(images: [])
  end
end
