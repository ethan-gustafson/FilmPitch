Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  get '/signup', to: 'users#new', as: "new_user"
  post '/signup', to: 'users#create', as: 'users_path'
  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'

  get '/auth/twitter/callback' => 'sessions#omniauth'

  resources :users, only: [:show, :edit, :update] do
    resources :pitches, only: [:index]
  end

  resources :pitches, only: [:index]

  resources :pitches, only: [:new, :create, :edit, :update, :destroy, :show] do 
    resources :funds, only: [:new, :create]
  end
end
