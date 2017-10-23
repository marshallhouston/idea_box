class IdeasController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def new
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new
    @categories = Category.all
  end

  def show
    @idea = Idea.find(params[:id])
    @user = @idea.user
  end

  def create
    @user = User.find(params[:user_id])
    @categories = Category.all
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      redirect_to user_ideas_path(@user)
    else
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
    @categories = Category.all
    @user = @idea.user
  end

  def update
    idea = Idea.find(params[:id])
    idea.update(idea_params)
    redirect_to user_idea_path(idea.user, idea)
  end

  def destroy
    idea = Idea.find(params[:id])
    user = idea.user
    idea.destroy

    redirect_to user_ideas_path(user)
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description, :category_id)
  end

end
