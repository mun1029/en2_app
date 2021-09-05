Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to:'posts#index'
  resources :posts
end
