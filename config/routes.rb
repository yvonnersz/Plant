Rails.application.routes.draw do

  root 'sessions#new'

  get '/signup' => 'customers#new'
  post '/signup' => 'customers#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :customers

end
