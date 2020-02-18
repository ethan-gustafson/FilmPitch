class UsersController < ApplicationController
    before_action :require_login # this will wrap each method with this action preventing non-user access.
    skip_before_action :require_login, only: [:new, :create] # this will skip only the sign up and log in pages.

    def home
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params) # when a new user is created, their wallet is set to 0 to avoid invalid data.
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        set_user
    end

    def edit
        set_user
    end

    def update
        if set_user.add_to_wallet(user_params[:wallet].to_i)
            redirect_to user_path(set_user)
        else
            redirect_to user_path(set_user)
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :name, 
            :username, 
            :email, 
            :password, 
            :password_confirmation,
            :wallet
        )
    end

end