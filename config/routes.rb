Rails.application.routes.draw do
  get 'sessions/new'

  resources :artists
  resources :playlists
  resources :tracks
  resources :albums
  resources :users
  root 'home#index'
  get 'index' => 'home#index'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
