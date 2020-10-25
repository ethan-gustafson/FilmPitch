class Users::RestController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])

    if @user.nil?
      redirect_to user_path(current_user)
    end
  end
end