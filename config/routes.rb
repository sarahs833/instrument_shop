Rails.application.routes.draw do
  get 'sessions/new', to: 'sessions#new'
  post 'sessions/create', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  root 'statics#page'
  get 'search_artist' => 'statics#search_artist'

  resources :users
  resources :password_resets, only: [:new, :create,:edit,:update]
  resources :products
  resources :lineitems
  resources :carts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
