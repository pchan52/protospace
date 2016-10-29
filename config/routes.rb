Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
  end
  scope module: :prototypes do
    resources :newest, only: :index
    resources :popular, only: :index
    resources :tags, only: [:index, :show]
  end
  resources :users, only: [:show, :edit, :update]
end
