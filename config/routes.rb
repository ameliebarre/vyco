Rails.application.routes.draw do
  resources :artists
  resources :playlists
  resources :tracks
  resources :albums
  resources :users
  root 'home#index'
  get 'index' => 'home#index'
end
