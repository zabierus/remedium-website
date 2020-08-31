# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
    layout "site"

  def create
    @user = User.find_by_email(params[:site_user][:email])
    if @user && @user.save
      toast :success, t('site.confirmation_instructions_sent')
      redirect_to new_site_user_session_path
    else
      toast :error, t('site.enter_email')
      redirect_to new_site_user_password_path
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
