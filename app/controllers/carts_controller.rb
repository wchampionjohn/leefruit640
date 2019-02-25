class CartsController < ApplicationController
  before_action :initialize_cart

  def add
    spec = Product::Spec.find_by(id: params[:id])
    if spec
      @cart.add_item(spec.id)
      session[:my_cart] = @cart.serialize
      head :no_content
    else
      render json: { message: "查無此商品" }, :status => 404
    end
  end

  def show
  end

  def checkout
    @order = Order.new
  end

end
