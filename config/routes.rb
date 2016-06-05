Rails.application.routes.draw do
  devise_for :users
  resources :artists
  resources :playlists
  resources :tracks
  resources :albums
  resources :styles
  root 'index#index'
  get 'index' => 'home#index'
end
