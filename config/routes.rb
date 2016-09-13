Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes,only: [:index, :new, :show, :create]
  # get  '/prototypes/index'  =>    'prototypes#index'
  # get  '/prototypes/new'    =>    'prototypes#new'
  # get  '/prototypes/show'   =>    'prototypes#show'
  resources :users, only: [:show, :edit, :update]
end
