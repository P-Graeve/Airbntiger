Rails.application.routes.draw do
  get 'pets/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'pages#home'

  resources :pets do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index]
end
