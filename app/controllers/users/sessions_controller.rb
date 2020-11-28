# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  def show
    redirect_to new_user_registration_path if !user_signed_in?
    @featured = Project.includes([:user, {cover_image_attachment: :blob}]).last
    @projects = Project.includes([:user, {cover_image_attachment: :blob}]).first(10)
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end