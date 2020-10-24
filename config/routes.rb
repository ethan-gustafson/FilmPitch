Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # `devise_for` is responsible to generate all needed routes for devise, 
  # based on what modules you have defined in your model.
  devise_scope :user do
    root 'users/sessions#show'
  end

  mount ActionCable.server => '/cable'

  devise_for :users, 
  path_names: {
    sign_in: 'login', 
    sign_out: 'logout'
  }, 
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # This method is going to look inside your User model and create the
    # needed routes:

    # new_user_session          GET    /users/login(.:format)             users/sessions#new
    # user_session              POST   /users/login(.:format)             users/sessions#create
    # destroy_user_session      DELETE /users/logout(.:format)            users/sessions#destroy
    # new_user_password         GET    /users/password/new(.:format)      users/passwords#new
    # edit_user_password        GET    /users/password/edit(.:format)     users/passwords#edit
    # user_password             PATCH  /users/password(.:format)          users/passwords#update
    #                           PUT    /users/password(.:format)          users/passwords#update
    #                           POST   /users/password(.:format)          users/passwords#create
    # cancel_user_registration  GET    /users/cancel(.:format)            users/registrations#cancel
    # new_user_registration     GET    /users/sign_up(.:format)           users/registrations#new
    # edit_user_registration    GET    /users/edit(.:format)              users/registrations#edit
    # user_registration         PATCH  /users(.:format)                   users/registrations#update
    #                           PUT    /users(.:format)                   users/registrations#update
    #                           DELETE /users(.:format)                   users/registrations#destroy
    #                           POST   /users(.:format)                   users/registrations#create
    # new_user_confirmation     GET    /users/confirmation/new(.:format)  users/confirmations#new
    # user_confirmation         GET    /users/confirmation(.:format)      users/confirmations#show
    #                           POST   /users/confirmation(.:format)      users/confirmations#create

    # user_twitter_omniauth_authorize GET|POST /users/auth/twitter(.:format)          users/omniauth_callbacks#passthru
    # user_twitter_omniauth_callback  GET|POST /users/auth/twitter/callback(.:format) users/omniauth_callbacks#twitter

  # You have to use `devise_for` on all routes where you'll need helpers such as `current_user`.
  # Use the `skip: :all` option in order to make them available without creating new routes.
  get '/users/:id', to: 'users/rest#show', as: 'user'

  resources :projects do
    get 'search', on: :collection
    get 'new-projects', on: :collection
    get 'popular-projects', on: :collection
    get 'fully-funded', on: :collection
    get 'film-types', on: :collection
  end

  get '/projects/film-types/:type', to: 'projects#film_type', as: 'film_type'

  get '/genres', to: 'genres#index'
  get '/genres/:name', to: 'genres#show', as: "genre"
  
  resources :comments, only: [:create, :update, :destroy]

  # resources :pitches, only: [:new, :create, :edit, :update, :destroy, :show] do 
  #   resources :funds, only: [:new, :create]
  # end
end

# To get a complete list of the available routes in your application, 
# visit http://localhost:3000/rails/info/routes in your browser while your server 
# is running in the development environment. You can also execute the `rails routes` 
# command in your terminal to produce the same output.
