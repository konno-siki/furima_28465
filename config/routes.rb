Rails.application.routes.draw do
  root to: 'items#index'
  resources :items
  resources :orders, only: :index
  devise_for :users
end
