Rails.application.routes.draw do
  get 'sheets/index'
  get 'sheets/new'
  get 'sheets/create'
  devise_for :users
  root 'homes#index'
end
