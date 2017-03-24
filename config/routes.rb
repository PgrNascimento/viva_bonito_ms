Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :tours, only: [:new, :create, :show, :edit, :update]
  resources :budgets, only: [ :new, :create, :show, :edit, :update ]
  resources :categories, only: [:index, :show]
  resources :prices, only: [:new, :create, :show, :edit, :update]
  resource  :dashboard, only: [:show]
  resources :high_seasons, only: [ :new, :create, :show ]

  namespace :admin do
    resources :categories, only: [:index, :new, :create, :show]
    resources :tours, only:[:index, :new]
  end


end
