class OrdersController < ApplicationController
  before_action :initialize_cart

  def new
  end

  def create
    order = Order.new(order_params)
    @cart.items.each do |item|
      order.order_items.new(product_id: item.product.id, quantity: item.quantity)
    end

    if order.save
      flash[:notice] = "訂單送出成功！"
      redirect_to products_path
    else
      render 'carts/checkout'
    end

  end

end
