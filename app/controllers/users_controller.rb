class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
    redirect_to user_path(current_user)
    end
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    @books = @user.books
    redirect_to(user_path(current_user)) unless @user == current_user
  end

end
