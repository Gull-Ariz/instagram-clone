class StoriesController < ApplicationController

  before_action :set_story, only: [:show, :destroy]
  before_action :can_authorize, only: [:show, :destroy]


  def index
    @stories = Story.where(user_id: current_user.followeds.pluck(:follower_id) << current_user.id)
    authorize @stories
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.new(story_params)
    if @story.save
      flash.alert = 'Story created successfully.'
      redirect_to authenticated_root_path
    else
      flash.alert = 'Error in creating Story'
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

  def can_authorize
    authorize @story
  end

  def story_params
    params.require(:story).permit(images: [])
  end

end
