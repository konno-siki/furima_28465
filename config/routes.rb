Rails.application.routes.draw do
  root to: 'items#index'
  resources :items
  resources :orders, only: [:index, :create]
  devise_for :users
end
