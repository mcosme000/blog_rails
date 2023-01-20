Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  get 'about', to: 'pages#about'

  # my articles routes are all here:
  resources :articles

  # get 'signup', to: 'users#new'
  # resources :users, except: [:new]

  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
end
