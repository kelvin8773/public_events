# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
  resources :events
  resources :attendances
end
