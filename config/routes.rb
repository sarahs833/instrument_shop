Rails.application.routes.draw do
  get 'sessions/new', to: 'sessions#new'
  post 'sessions/create', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy'
  root 'statics#page'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
