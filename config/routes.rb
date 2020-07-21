Rails.application.routes.draw do

  get '/' => 'application#welcome'

  get '/about' => 'application#about'

  get '/signup' => 'customers#new'
  post '/signup' => 'customers#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#fbcreate'

  get '/indoor_plants/:id/buy' => 'indoor_plants#buy'
  get '/indoor_plants/:id/buy' => 'indoor_plants#buy'

  
  resources :customers do
    resources :stores, only: [:index, :show, :new, :create]
  end
  
  resources :stores do
    resources :indoor_plants
  end

  resources :indoor_plants

end
