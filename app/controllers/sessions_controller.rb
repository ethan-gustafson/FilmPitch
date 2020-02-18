class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user.try(:authenticate, params[:user][:password]) # if try password and succeed, create session
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to new_user_path # if the password fails redirect to the signup page
        end
    end

    def destroy
        session.delete :user_id
        redirect_to new_user_path
    end

    def omniauth
        @user = User.find_or_create_by(uid: auth[:uid]) do |u| # we created a new migration adding a column to users for a uid:string
            u.name= auth[:info][:name] # uid is a string since the hash provider by twitter encases the uid in a string.
            u.username= auth[:info][:nickname] # instead of username, twitter uses "nickname"
            u.email= auth[:info][:email]
            u.wallet= 0 # we instantiate the user with a wallet of 0 so that the user will be valid.
            u.password= SecureRandom.hex # password is secured by SecureRandom.hex
        end
        
        if @user.valid? # if the user is valid, create a session and redirect to that user.
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end