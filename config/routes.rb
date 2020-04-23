Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'how-it-works', to: 'pages#how_it_works'
  get 'about-us', to: 'pages#about_us'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
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
