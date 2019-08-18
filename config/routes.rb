Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'

  root 'page#home'

  get 'page/home'
  get 'page/about'
  get 'page/contact'
  resources :users

  
end
