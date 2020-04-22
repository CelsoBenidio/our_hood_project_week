Rails.application.routes.draw do
  get 'preferences/new'
  get 'how-it-works', to: 'pages#how-it-works'
  get 'about-us', to: 'pages#about-us'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :preferences, only: [:new, :create]
  resources :boxes, only: [:index]
  resources :products, only: [:index, :new, :create]
  resources :cart_products, only: [:create, :destroy]
  resources :carts, only: [:show, :update]
  resources :orders, only: [:show]
end
