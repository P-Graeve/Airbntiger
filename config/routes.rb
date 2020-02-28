Rails.application.routes.draw do
  get 'pets/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'pages#home'

  namespace :admin do
    resources :pets, only: :index
  end

  resources :pets do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index] do
    resources :reviews, only: [:create]
  end
end
