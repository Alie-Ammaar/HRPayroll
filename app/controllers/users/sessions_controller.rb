# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :update_last_signed_in_time, only: [:destroy]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    if resource.is_active
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))

      flash[:warning ] = "Your account has been deactivated."
      redirect_to new_user_session_path 
    end

  end


  protected
  def update_last_signed_in_time
    if current_user.present?
      current_user.update_attributes(last_signed_in: DateTime.now.utc)
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
