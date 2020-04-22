Rails.application.routes.draw do
  get 'preferences/new'
  get 'how-it-works', to: 'pages#how-it-works'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :preferences, only: [:new, :create]
  resources :boxes, only: [:index]


  # resources :carts, only: [:show]
  get '/cart', to: 'carts#show'

  resources :products, only: [:index, :new, :create]
  resources :cart_products, only: [:create, :destroy]
  resources :carts, only: [:show, :update]

  resources :orders, only: [:show]
end
