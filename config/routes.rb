Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/new'
  get 'bookings/show'
  resources :bookings
  get 'sessions/new'
  root 'pages#top'
  get "signup", to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :rooms do
    collection do
      get 'search'
    end
  end
end
