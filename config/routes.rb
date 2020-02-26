Rails.application.routes.draw do
  get 'pets/index'
  devise_for :users
  root to: 'pages#home'
  resources :pets, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :bookings, only: [:create]
end
