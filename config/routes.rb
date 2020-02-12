Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  get '/signup', to: 'users#new', as: "new_user"
  resources :users, only: [:create, :show, :edit, :update] do
    resources :pitches, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  get '/pitches', to: 'all_users_pitches#index', as: 'pitches'

  resources :pitches, only: [:show] do 
    resources :funds, only: [:new, :create]
  end
  
  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'
end

# sessions_path	POST	/sessions(.:format)	
# sessions#create

# new_session_path	GET	/sessions/new(.:format)	
# sessions#new