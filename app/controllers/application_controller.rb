class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_cart
  helper_method :cart_items_count
  def initialize_cart
    @cart = Cart.build_from_hash(session[:my_cart])
  end


  def clear_cart
    session.delete(:my_cart)
  end

  def cart_items_count
    @cart.items_count
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :phone])
  end

end
