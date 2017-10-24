class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # add flash message for success
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # add message for failure
      render :new
    end
  end

  def show
    @ideas = current_user.ideas
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
