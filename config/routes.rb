Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # To get a complete list of the available routes in your application, 
  # visit http://localhost:3000/rails/info/routes in your browser while your server 
  # is running in the development environment. You can also execute the `rails routes` 
  # command in your terminal to produce the same output.

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

  # The devise_for method is going to look inside your User model and create the
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

  get '/users/:id', to: 'users/rest#show', as: 'user'

  resources :projects, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  scope 'projects' do
    scope 'catelog' do
      get '/search', to: 'project_variations#search', as: 'search_projects'
      get '/new-projects', to: 'project_variations#new_projects', as: 'newly_created_projects'
      get '/popular-projects', to: 'project_variations#popular_projects', as: 'popular_projects'
      get '/fully-funded', to: 'project_variations#fully_funded', as: 'fully_funded_projects'
      get '/film-types', to: 'project_variations#film_types', as: 'film_types_projects'
      get '/film-types/:type', to: 'project_variations#film_type', as: 'film_type_projects'
    end
  end

  get '/genres', to: 'genres#index'
  get '/genres/:name', to: 'genres#show', as: "genre"
  
  resources :comments, only: [:create, :update, :destroy]
end
