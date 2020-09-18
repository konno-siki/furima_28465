Rails.application.routes.draw do
  root to: 'items#index'
  resources :items
  resources :orders, only: :index
  devise_for :users
  get 'items/:id', to: 'items#price'
end
