class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :phone])
  end

  private
  def initialize_cart
    @cart = Cart.build_from_hash(session[:my_cart])
  end
end
