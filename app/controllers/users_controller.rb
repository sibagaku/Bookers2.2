class UsersController < ApplicationController
  
  before_action :correct_user,only:[:edit,:update]
  
  def index
    @new_book = Book.new
    @book = @new_book
    @book.user = current_user
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @book = @new_book
    @book.user = current_user
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:"You have updated user successfully."
    else
      render:edit
    end
  end
  
private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
  end
  
end
