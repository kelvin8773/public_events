Rails.application.routes.draw do
  root 'pages#home'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get 'pages/home'
  get 'pages/about'

  resources :users
end
