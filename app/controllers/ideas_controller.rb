class IdeasController < ApplicationController

  before_action :check_logged_in
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :load_images_and_categories, only: [:new, :edit]

  def index
    @ideas = current_user.ideas
  end

  def new
    @idea = current_user.ideas.new
  end

  def show
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to user_idea_path(current_user, @idea)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @idea.update(idea_params)
    redirect_to user_idea_path(current_user, @idea)
  end

  def destroy
    @idea.destroy
    redirect_to user_ideas_path(current_user)
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description, :category_id, image_ids:[])
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def load_images_and_categories
    @categories = Category.all
    @images = Image.all
  end
end
