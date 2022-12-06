Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: {
                        omniauth_callbacks: 'omniauth'
                    }
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests


  resources :likes

  resources :posts do
      resources :comments
  end
  

end
