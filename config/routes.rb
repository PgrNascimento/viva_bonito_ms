Rails.application.routes.draw do
  resources :tours, only: [:new, :create, :show, :edit, :update]
end
