class BooksController < ApplicationController

  before_action :correct_user,only:[:edit,:update]

  def index
    @new_book = Book.new
    @book = @new_book
    @book.user_id = current_user.id
    @books = Book.all
    @user = current_user
  end

  def create
    @new_book = Book.new(book_params)
    @book = @new_book
    @book.user_id = current_user.id
    @books = Book.all
    @user = current_user
    if @book.save
      redirect_to book_path(@book.id), notice:"You have created book successfully."
    else
      render:index
    end
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = @book.user
    @book_comment = BookComment
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice:"You have updated book successfully."
    else
      render:edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
