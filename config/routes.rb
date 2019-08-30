Rails.application.routes.draw do
  root 'events#index'

  get 'attendances/new'
  get 'events/index'
  get 'events/show'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/profile', to: 'users#show'
  
  resources :users
  resources :events
  resources :attendances

end
