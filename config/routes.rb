Rails.application.routes.draw do
  resources :tours, only: [:new, :create, :show, :edit, :update]
  root 'home#index'
  resources :budgets, only: [ :new, :create, :show, :edit, :update ]
  resources :categories, only: ['new', 'create', 'show']
  resources :prices, only: [:new, :create, :show]

end
