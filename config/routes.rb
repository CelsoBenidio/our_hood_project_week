Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'preferences/new'
  get 'how-it-works', to: 'pages#how-it-works'
  get 'about-us', to: 'pages#about-us'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks",
                                   sessions: "sessions",
                                   registrations: "registrations"}
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
