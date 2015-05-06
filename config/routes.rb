Rails.application.routes.draw do
  root 'contacts#index'

    resources :users

    resources :contacts

    resource :session

    resources :groups

  # get 'password_resets/new'
  # get '/set/:password_reset_token' => 'password_resets#edit', as: 'reset_short'
  # patch '/update/:password_reset_token' => 'password_resets#update', as: 'update_password'
end
