module UserHelper

    def set_user
        if User.find_by_id(params[:id])
            @user = User.find(params[:id])
        else
            redirect_to pitches_path
        end
    end

end