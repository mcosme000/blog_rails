Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'

  # my articles routes are all here:
  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
