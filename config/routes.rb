Rails.application.routes.draw do
  resources :phone_suggestions
  # ActiveAdmin.routes(self)
  resources :users
  resources :messages #Out since feed is weak?,    :only => [ :create, :destroy ]
  resources :contacts
  resources :announces
  resources :sessions, :only => [ :new, :create, :destroy ]
  root              :to => 'pages#home'
  get '/contactus', :to => 'pages#contactus'
  get '/about',     :to => 'pages#about'
  get '/signup',    :to => 'users#new'
  get '/signin',    :to => 'sessions#new'
  post '/signin',    :to => 'sessions#create'
  delete '/signout',   :to => 'sessions#destroy'
  get '/messagesincoming/:id/:salt_fragment',       :to => 'messages#messagesin'
  get '/announces/:id/hide', to: 'announces#hide', as: 'hide_announce'
  get '/search-numbers', :to => 'buy_phones#search_numbers'
  post '/search-options', :to => 'buy_phones#search_options'
  post '/buy-number', :to => 'buy_phones#buy_number'
  # if Rails.env.development?
    match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]
  # end
end
