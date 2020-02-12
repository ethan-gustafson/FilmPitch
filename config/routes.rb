Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  resources :users, only: [:new, :create, :show] do
    resources :pitches, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  resources :pitches, only: [:index, :show] do 
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