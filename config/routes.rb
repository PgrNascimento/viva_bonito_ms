Rails.application.routes.draw do
  resources :categories, only: ['new', 'create', 'show']
end
