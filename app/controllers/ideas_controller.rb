class IdeasController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def new
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new
  end

  def show
    @user = User.find(params[:user_id])
    @idea = @user.ideas.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      redirect_to user_ideas_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @idea = @user.ideas.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    idea = user.ideas.find(params[:id])
    idea.update(idea_params)
    redirect_to user_idea_path(user, idea)
  end

  

  private

  def idea_params
    params.require(:idea).permit(:name, :description)
  end

end
