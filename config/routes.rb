Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'my-portfolio', to: 'users#my_portfolio'
end
