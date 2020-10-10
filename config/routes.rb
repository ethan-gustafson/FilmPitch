Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users/sessions#show'

  # `devise_for` is responsible to generate all needed routes for devise, 
  # based on what modules you have defined in your model.
  devise_for :users, 
  path_names: {
    sign_in: 'login', 
    sign_out: 'logout'
  }, 
  controllers: {
    sessions: 'users/sessions'
  }

  # This method is going to look inside your User model and create the
    # needed routes:

    # new_user_session          GET    /users/login(.:format)             devise/sessions#new
    # user_session              POST   /users/login(.:format)             devise/sessions#create
    # destroy_user_session      DELETE /users/logout(.:format)            devise/sessions#destroy
    # new_user_password         GET    /users/password/new(.:format)      devise/passwords#new
    # edit_user_password        GET    /users/password/edit(.:format)     devise/passwords#edit
    # user_password             PATCH  /users/password(.:format)          devise/passwords#update
    #                           PUT    /users/password(.:format)          devise/passwords#update
    #                           POST   /users/password(.:format)          devise/passwords#create
    # cancel_user_registration  GET    /users/cancel(.:format)            devise/registrations#cancel
    # new_user_registration     GET    /users/sign_up(.:format)           devise/registrations#new
    # edit_user_registration    GET    /users/edit(.:format)              devise/registrations#edit
    # user_registration         PATCH  /users(.:format)                   devise/registrations#update
    #                           PUT    /users(.:format)                   devise/registrations#update
    #                           DELETE /users(.:format)                   devise/registrations#destroy
    #                           POST   /users(.:format)                   devise/registrations#create
    # new_user_confirmation     GET    /users/confirmation/new(.:format)  devise/confirmations#new
    # user_confirmation         GET    /users/confirmation(.:format)      devise/confirmations#show
    #                           POST   /users/confirmation(.:format)      devise/confirmations#create

  # You have to use `devise_for` on all routes where you'll need helpers such as `current_user`.
  # Use the `skip: :all` option in order to make them available without creating new routes.
    
  resources :projects, only: [:new, :create, :edit, :update, :destroy, :show]

  # get '/auth/twitter/callback' => 'sessions#omniauth'

  # resources :pitches, only: [:new, :create, :edit, :update, :destroy, :show] do 
  #   resources :funds, only: [:new, :create]
  # end
end
