Rails.application.routes.draw do
  get 'braintree/new'

  root 'statics#home', as: "home"
  

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  ### from url /sign_up to what controller and call var as (using at link_to)
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  post "/sign_up" => "users#create", as: "submit" ###

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  ### rewriting user_controller for create -- changing controller from clearance to mine
  resources :users, controller: "users", only: [:show, :edit, :create, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :listings do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:destroy] 

  get '/auth/failure' => "statics#home"

  post 'braintree/checkout'
end
