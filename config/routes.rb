Rails.application.routes.draw do

  get '/' => 'application#welcome'

  get '/about' => 'application#about'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#fbcreate'

  get '/indoor_plants/:id/buy' => 'indoor_plants#buy'

  get '/stores/:id/plants_sold' => 'stores#plants_sold', as: :plants_sold

  post '/indoor_plants/by_price' => 'indoor_plants#index'

  post '/stores/:id' => 'stores#show'

  resources :users, except: [:index] do
    resources :stores, only: [:index, :show, :new, :create]
  end
  
  resources :stores do
    resources :indoor_plants, except: [:index, :show]
  end

  resources :indoor_plants, except: [:show]

end
