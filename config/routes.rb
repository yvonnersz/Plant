Rails.application.routes.draw do

  get '/' => 'application#welcome'

  get '/signup' => 'customers#new'
  post '/signup' => 'customers#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#fbcreate'

  get '/indoor_plants/:id/buy' => 'indoor_plants#buy'
  get '/indoor_plants/:id/buy' => 'indoor_plants#buy'

  
  resources :customers
  resources :stores
  resources :indoor_plants

end
