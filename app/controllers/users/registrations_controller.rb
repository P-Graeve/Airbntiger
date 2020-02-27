# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
    # save the geolocation of the user
    return unless @user.valid?

    user_geolocation = Geolocation.new(sign_up_coords_params)
    user_geolocation.user = @user

    # check if the coordinates were properly passed thru
    if user_geolocation.save
      # check is there are last_page params present
      if params[:last_page].present?
        # redirect_to params[:last_page]
        return
      else
        # redirect to the home page
        redirect_to root_path
      end
    else
      # something went wrong when saving the geolocation
      # we cannot use this app without the geolocation, so we'd have to delete the user and say something went wrong
      user = @user
      @user.destroy
      return
      # redirect_to new_user_registration_path(geo: false)
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def sign_up_coords_params
    params.permit(:latitude, :longtitude)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
