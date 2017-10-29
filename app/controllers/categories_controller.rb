class CategoriesController < ApplicationController

  before_action :check_logged_in, only: :show

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @ideas = @category.ideas.where(user_id: current_user.id)
  end
end
