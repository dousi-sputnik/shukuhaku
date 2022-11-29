Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#top'
  get "signup", to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :rooms
  get "search", to: "rooms#search"
end
