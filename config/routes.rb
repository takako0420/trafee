Rails.application.routes.draw do
  get 'documents/new'
  root 'users#index'
  devise_for :users
  resources :sheets 
end
