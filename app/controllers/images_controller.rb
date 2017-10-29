class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
    @ideas = @image.ideas.where(user_id: current_user.id)
  end
end
