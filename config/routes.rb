Rails.application.routes.draw do
  get 'sessions/new', to: 'sessions#new'
  get 'sessions/create', to: 'sessions#create'
  root 'statics#page'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
