class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to MOSHI blog, #{@user.username}, you have signup successfully"
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

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
    params.require(:user).permit(:username, :email, :password_digest, :photo)
  end
end
