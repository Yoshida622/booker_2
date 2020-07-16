Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/index'
  # get 'users/edit'
  devise_for :users
  root 'homes#home'
  get 'homes/about'
  resources :users, only: [:index,:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
