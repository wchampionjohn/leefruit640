class OrdersController < ApplicationController
  before_action :initialize_cart
  before_action :authenticate_user!
  before_action only: [:new, :create] do
    @delivery_way_options = Order.delivery_ways.map do |way, key|
      [Order.human_attribute_name("delivery_way.#{way}"), key]
    end
  end

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

    if order.save
      clear_cart
      flash[:notice] = "訂單送出成功！"
      redirect_to orders_path
    else
      @user = current_user
      @order = order
      @area_options = Area.where(city_id: order.city_id)
      flash[:alert] = order.errors.full_messages.join("\r\n")
      render 'orders/new'
    end

  end
  private
  def order_params
    params.require(:order).permit(:name, :phone,:city_id, :area_id, :address, :email, :note)
  end
end
