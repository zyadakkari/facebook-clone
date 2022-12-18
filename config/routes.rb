Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users, controllers: {
                        omniauth_callbacks: 'omniauth'
                    }

  resources :friends, only: [:index, :destroy, :create] do
      resources :friend_requests do
          member do
              post 'update'
          end
      end
  end

  resources :users do
      resources :friend_requests
  end

  get 'friends/index'
  resources :friend_requests do
      member do
          post 'update'
      end
  end


  resources :likes, only: [:index, :create, :destroy]

  resources :posts do
      resources :comments
      resources :likes
  end


end
