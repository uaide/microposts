Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  post   'search', to: 'static_pages#index'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
    get 'followings', on: :member
    get 'followers', on: :member
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts do
    post 'retweet', on: :member
  end
  resources :relationships, only: [:create, :destroy]
end
