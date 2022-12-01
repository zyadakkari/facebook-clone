Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests

  root "posts#index"

  resources :likes
  resources :comments
  resources :posts
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
