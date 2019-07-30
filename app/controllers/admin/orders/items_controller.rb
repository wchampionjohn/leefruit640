class Admin::Orders::ItemsController < ResourcesController
  before_action :authenticate_admin!
  layout "admin"

  before_action only: [:new, :edit, :update, :create] do
    @order = ::Order.find params[:order_id]
  end

  def current_collection
    ::OrderItem.all.where(order_id: params[:order_id])
  end

  def permitted_attributes
    [ :product_id, :quantity, :order_id]
  end

  def url_after_create
    edit_admin_order_item_path(@order.id, current_collection.last.id)
  end

end
