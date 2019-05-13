# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  layout "application"
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  before_action only: [:edit] do
    @area_options = Area.where(city_id: current_user.city_id)
  end

  before_action only: [:new] do
    @area_options = Area.where(city_id: City.first.id)
  end

  before_action only: [:update] do
    city_id = params[:user][:city_id] || current_user.city_id
    @area_options = Area.where(city_id: city_id)
  end

  before_action only: [:create] do
    city_id = params[:user][:city_id] || City.first.id
    @area_options = Area.where(city_id: city_id)
  end

  # GET /resource/sign_up

  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end
  #
 def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    @user = User.find(current_user.id)

    # required for settings form to submit when password is left blank
    if @user.login_social?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
      account_update_params.delete("current_password")

      if @user.update_attributes(account_update_params)
        set_flash_message :notice, :updated
        # Sign in the user bypassing validation in case their password changed
        sign_in @user, :bypass => true
        redirect_to after_update_path_for(@user)
      else
        render "edit"
      end
    else
      super
    end

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :phone, :city_id, :area_id])
   end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :phone, :city_id, :area_id])
  end


  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  #
  protected

  #def update_resource(resource, params)
    #resource.update_without_password(params)
  #end
  #def update_resource(resource, params)
    #resource.update_without_password(params)
  #end
  #

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present?
  end
end
