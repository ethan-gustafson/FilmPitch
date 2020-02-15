module UserHelper

    def set_user
        @user = User.find(params[:id])
    end

end