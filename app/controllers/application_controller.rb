class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception #csrf
    helper_method :logged_in
    helper_method :current_user
    helper_method :require_login
    include UserHelper
    
    def logged_in
        if !session[:user_id]
            redirect_to new_user_path
        end
    end

    def current_user
        User.find(session[:user_id])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
