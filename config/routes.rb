Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'index' => 'home#index'
  resources :users
end
