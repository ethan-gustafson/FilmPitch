Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  get '/signup', to: 'users#new', as: "new_user"
  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:create, :show, :edit, :update] do
    resources :pitches, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  get '/pitches', to: 'all_users_pitches#index', as: 'pitches'

  resources :pitches, only: [:show] do 
    resources :funds, only: [:new, :create]
  end
end
