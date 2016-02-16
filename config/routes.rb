Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  root 'crops#index'

  resources :wishlists, except: [:show, :edit]
  resources :trades
  resources :crops, except: [:show]
  resources :users

  # get "/login" => 'session#new'
  # post 'session/create'
  # delete 'session/destroy'
end
