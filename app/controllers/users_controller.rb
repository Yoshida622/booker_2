class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]


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
    user = User.find(params[:id])
    if user.update(user_params)
       redirect_to user_path(user.id), notice: 'successfully'
    else
       @user = User.find(params[:id])
       flash.now[:alert] = "error can't be blank"
       render :edit
    end
  end

  def  user_params
    params.require(:user).permit(:name, :iintroduction, :profile_image)
  end

end
