Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  get 'home/filter_period', 'home#filter_period'

  resources :tours, only: [:show]
  resources :budgets, only: [:new, :create, :show, :edit, :update]
  resource  :dashboard, only: [:show]

  namespace :admin do
    resources :categories, only: [:index, :new, :create, :show]
    resources :tours, only:[:index, :new, :create, :edit, :update, :destroy, :show]
    resources :high_seasons, only: [:index, :new, :create, :show]
    resources :prices, only: [:index, :new, :create, :show, :edit, :update]
  end
end
