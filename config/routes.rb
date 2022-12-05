Rails.application.routes.draw do
  root 'posts#index'

  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests


  resources :likes
  resources :comments
  resources :posts
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
end
