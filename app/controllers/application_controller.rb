class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def after_sign_in_path_for(resource)
  	user_path(current_user.id)
  end
  def after_sign_out_path_for(resource)
     root_path
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_url(current_user.id) unless @user == current_user
  end

  def correct_book
    # @user = User.find(params[:id])
    @book = Book.find(params[:id])
    redirect_to books_path unless current_user.id == @book.user_id
  end

end
