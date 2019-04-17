class OrdersController < ApplicationController
  before_action :initialize_cart
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders.order(id: :desc)
  end

  def new
    @user = current_user
    @order = Order.new
    city_id = City.first.id
    @area_options = Area.where(city_id: city_id)
  end

  def create
    order = Order.new(order_params)
    order.user_id = current_user.id
    @cart.items.each do |item|
      order.order_items.new(
        product_id: item.product.id,
        quantity: item.quantity,
        price: item.price
      )
    end

    if order.save!
      clear_cart
      flash[:notice] = "訂單送出成功！"
      redirect_to orders_path
    else
      render 'carts/checkout'
    end

  end
  private
  def order_params
    params.require(:order).permit(:name, :phone,:city_id, :area_id, :address, :email, :note)
  end
end
