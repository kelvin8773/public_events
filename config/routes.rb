Rails.application.routes.draw do
  get 'attendances/new'
  get 'events/index'
  get 'events/show'
  root 'users#show'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  resources :users
  resources :events
end
