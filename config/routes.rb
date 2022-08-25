Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to:'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts, only:[:index, :show, :new, :create, :destroy] do
    resources :comments, only: [:new, :create, :destroy]
    resources :likes, only: [:new, :create]
  end

  namespace :api, :defaults => {:format => :json} do
    post '/auth/login', to: 'authentication#login'
    resources :users, only:[:index, :show, :create] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create] 
    end
  end
end

  # Defines the root path route ("/")
  # root "articles#index"
end
