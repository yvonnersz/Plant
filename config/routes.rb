Rails.application.routes.draw do

  get '/signup' => 'customers#new'
  post '/signup' => 'customers#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
