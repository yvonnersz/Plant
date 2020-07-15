Rails.application.routes.draw do

  get '/' => 'application#welcome'

  get '/signup' => 'customers#new'
  post '/signup' => 'customers#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#fbcreate'
  
  resources :customers

end
