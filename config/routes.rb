Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :tours, only: [:new, :create, :show, :edit, :update]
  resources :budgets, only: [ :new, :create, :show, :edit, :update ]
  resources :categories, only: ['index', 'new', 'create', 'show']
  resource :dashboard, only: ['show']
end
