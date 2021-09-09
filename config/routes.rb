Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to:'posts#index'
  resources :posts do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
