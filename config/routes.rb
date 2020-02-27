Rails.application.routes.draw do
  get 'pets/index'
  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    resources :pets, only: :index
  end

  resources :pets do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index]
end
