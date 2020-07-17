class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user  = User.find(current_user.id)
  end

  def show
    @user = User.find_by(params[:user_id])
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
       redirect_to book_path(book.id)
    else
       @book = Book.find(params[:id])
       render :edit
    end
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
       redirect_to book_path(book.id,book.user_id)
    else
       @books = Book.all
       @book = Book.new
       render :index
    end
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

  
end
