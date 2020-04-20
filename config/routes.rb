Rails.application.routes.draw do
  get 'preferences/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :preferences, only: [:new, :create]
  resources :boxes, only: [:index]
  resources :products, only: [:index]
  resources :carts, only: [:show]
  resources :orders, only: [:show]
end
