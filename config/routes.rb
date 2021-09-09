Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to:'posts#index'
  resources :posts do
    member do
      get 'select_category_index'
    end
  end
  resources :categories, only: :new
end
