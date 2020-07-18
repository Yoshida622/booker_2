class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :correct_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    @user  = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end
end
