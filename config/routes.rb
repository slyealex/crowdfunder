Rails.application.routes.draw do
  root 'projects#index'

  resources :projects

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
