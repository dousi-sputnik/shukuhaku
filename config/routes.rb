Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/new'
  get 'rooms/search'
  get 'rooms/show'
  get 'sessions/new'
  root 'pages#top'
  get "signup", to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
