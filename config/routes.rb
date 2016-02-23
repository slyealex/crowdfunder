Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :rewards, only: [:create, :new, :destroy]
    resources :pledges
  end

  resources :users
end
