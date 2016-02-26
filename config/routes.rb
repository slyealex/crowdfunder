Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :comments, only: [:create, :show, :destroy]
    resources :rewards, only: [:create, :new, :destroy] do
      resources :pledges
    end

  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :categories, only: [:index, :show]
end
