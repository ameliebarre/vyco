Rails.application.routes.draw do
  resources :albums
  get 'home/index'
  root 'home#index'
  get 'index' => 'home#index'
  resources :users
end
