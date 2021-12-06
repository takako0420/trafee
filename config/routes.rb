Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :sheets do
    resources :documents, only: [:new]
  end
end
