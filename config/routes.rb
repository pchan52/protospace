Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
  end
  scope module: :prototypes do
    resources :newest, only: :index
    resources :popular, only: :index
  end
  resources :users, only: [:show, :edit, :update]
end
