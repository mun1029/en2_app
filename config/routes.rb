Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to:'posts#index'
  resources :posts do
    member do
      get 'select_category_index'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  namespace :api, format: 'json' do
    get 'posts/preview'
  end
  resources :categories, only: :new
end
