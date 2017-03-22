Rails.application.routes.draw do
  root 'home#index'
  resources :tours, only: [ :new, :create, :show, :edit, :update ]
  resources :budgets, only: [ :new, :create, :show, :edit, :update ]
  resources :categories, only: [ :new, :create, :show ]
  resources :high_seasons, only: [ :new, :create, :show ]
end
