Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :budgets, only: [ :new, :create, :show, :edit, :update ]
  resources :categories, only: ['new', 'create', 'show']
end
