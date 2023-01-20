class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @colors = ['#0476f1', '#cbbada', '#e7e5e6', '#f4c524']
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Hey #{@user.username}, your account was successfully updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :photo)
  end
end
