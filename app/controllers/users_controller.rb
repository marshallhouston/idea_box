class UsersController < ApplicationController

  before_action :check_logged_in, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thanks for signing up!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = "Invalid email/password"
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
