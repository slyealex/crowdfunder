Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :rewards, only: [:create, :new, :destroy] do
      resources :pledges
    end

  end

  resources :sessions, only: [:create, :new, :destroy]

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
