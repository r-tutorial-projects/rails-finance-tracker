Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  devise_for :users
  resources :users, only: [:show]
  root 'welcome#index'
  get 'my-portfolio', to: 'users#my_portfolio'
  get 'search-stock', to: 'stocks#search'
  get 'my-friends', to: 'users#my_friends'
  get 'search-friends', to: 'users#search'
end
