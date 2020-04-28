Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  get 'how-it-works', to: 'pages#how_it_works'
  get 'about-us', to: 'pages#about_us'
  get 'stores', to: 'pages#stores'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks",
                                   sessions: "sessions",
                                   registrations: "registrations"}

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :preferences, only: [:new, :create]
  resources :boxes, only: [:index]

  get '/cart', to: 'carts#show'
  patch '/cart', to: 'carts#update'

  resources :shops, only: [:new, :create]

  resources :products, only: [:index, :new, :create]
  resources :cart_products, only: [:create, :destroy]

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  # 1. create API namespaces -> (:api and :v1)
  # 2. Create an API controller -> StripeController
  # 3. The controller should have an action to create a customer -> (create_a_customer)

  namespace :api, defaults: { format: :json } do
     namespace :v1 do
       post '/create_customer', to: 'stripe#create_a_customer'
     end
   end
end






































