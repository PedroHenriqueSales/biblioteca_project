Rails.application.routes.draw do

  get 'signup' => 'users#new'
  resources :users
  root "sessions#new"
  resources :books
  resource :session

 end
