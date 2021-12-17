Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  root 'users#index'
  devise_for :users
  resources :sheets
  resources :documents, only: [:new, :create]
  resources :comments, only: [:new, :create]
end
