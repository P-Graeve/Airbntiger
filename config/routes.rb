Rails.application.routes.draw do
  get 'pets/index'
  devise_for :users
  root to: 'pages#home'
  resources :pets, only: [:index]
end
