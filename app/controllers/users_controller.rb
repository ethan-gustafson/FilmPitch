class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def home
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        set_user # set user
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