Rails.application.routes.draw do
  devise_for :users
  resources :artists
  resources :playlists
  resources :tracks
  resources :albums
  resources :styles
  resource :admins
  resource :display_favorite_artists
  get 'favorite_artists' => 'display_favorite_artists#show'
  resources :favorite_artists, only: [:create, :destroy]
  root 'index#index'
  get 'index' => 'home#index'

  resources :artists do
     member do
        put "like" => "artists#upvote"
        put "dislike" => "artists#downvote"
     end
  end

end
