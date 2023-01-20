Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session_path
  end

  root to: 'pages#home'

  get 'about', to: 'pages#about'

  # my articles routes are all here:
  resources :articles
  resources :users, except: [:new]

end
