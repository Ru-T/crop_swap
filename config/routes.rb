Rails.application.routes.draw do
  root 'crops#index'

  resources :wishlists, except: [:show, :edit]
  resources :trades
  resources :crops, except: [:show]
  resources :users
  devise_for :users
end
