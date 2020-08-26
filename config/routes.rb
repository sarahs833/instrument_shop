Rails.application.routes.draw do
  get 'products/index'
  get 'products/new'
  get 'products/show'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'
  get 'sessions/new', to: 'sessions#new'
  post 'sessions/create', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  root 'statics#page'

  resources :users
  resources :password_resets, only: [:new, :create,:edit,:update]
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
