Rails.application.routes.draw do
  resources :styles
  resources :categories
  resources :items
  resources :outfit_items
  resources :outfits
  resources :users

  get '/welcome', to: 'application#welcome' 
  get '/new_account', to: 'application#new_account'
  post '/create_account', to: 'application#create_account'
  get '/home', to: 'application#home'
  get '/analytics', to: 'application#analytics'
  get '/login', to: 'auth#new'
  post '/login', to: 'auth#create'
  delete '/login', to: 'auth#destroy'
  
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
