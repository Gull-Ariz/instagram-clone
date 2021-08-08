class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end
  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    if @story.save
      redirect_to @story
    else
      render 'new'
    end
  end
  def show
    @story = Story.find(params[:id])
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_path
  end
  private
  def story_params
    params.require(:story).permit(images: [])
  end
end
