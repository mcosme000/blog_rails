class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @users = policy_scope(User).all
  end

  def show
    @colors = ['#0476f1', '#cbbada', '#e7e5e6', '#f4c524']
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
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

  def set_user
    @user = User.find(params[:id])
  end
end
