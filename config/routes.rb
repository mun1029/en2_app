Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :users, only: :show do
    member do
      get 'favorite_posts_show'
    end
  end
  resources :posts do
    resources :favorites, only: %i[create destroy]
    member do
      get 'select_category_index'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    collection do
      get 'keyword_search'
    end
  end

  namespace :api, format: 'json' do
    get 'posts/preview'
  end

  resources :categories, only: :new
end
