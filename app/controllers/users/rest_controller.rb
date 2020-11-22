class Users::RestController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    redirect_to user_path(current_user) if @user.nil?
  end
end