class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_book, only: [:edit]

  def index
    @books = Book.all
    @book = Book.new
    @user  = User.find(current_user.id)
  end

  def show
    book = Book.find(params[:id])
    @user = book.user
    @book = Book.new
    @books = @user.books
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.user_id = current_user.id
    if book.update(book_params)
       redirect_to book_path(book.id), notice: 'successfully'
    else
       @book = Book.find(params[:id])
       flash.now[:alert] = "error can't be blank"
       render :edit
    end
  end

  def create
    @user  = User.find(current_user.id)
    @books = Book.all
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
       redirect_to book_path(book.id), notice: 'successfully'
    else
       @user  = User.find(current_user.id)
      #  @books = Book.all
       @book = Book.new
       flash.now[:alert] = "error can't be blank"
       render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

  
end
