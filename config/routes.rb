Rails.application.routes.draw do
  devise_for :users
  resources :artists
  resources :playlists
  resources :tracks
  resources :albums
  resources :styles
  resource :admins
  resource :selections
  resource :display_favorite_artists
  resource :display_favorite_albums
  resources :favorite_artists, only: [:create, :destroy]
  resources :favorite_albums, only: [:create, :destroy]
  root 'index#index'
  get 'index' => 'home#index'
  get 'favorite_artists' => 'display_favorite_artists#show'
  get 'favorite_albums' => 'display_favorite_albums#show'

  resources :artists do
     member do
        put "like" => "artists#upvote"
        put "dislike" => "artists#downvote"
     end
  end

end
