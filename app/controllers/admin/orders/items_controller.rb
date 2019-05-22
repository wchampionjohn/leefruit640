class Admin::Orders::ItemsController < ResourcesController
  before_action :authenticate_admin!
  layout "admin"

  before_action only: [:new, :edit, :update, :create] do
    @order = ::Order.find params[:order_id]
  end

  def collection_scope
    ::OrderItem.all.where(order_id: params[:order_id])
  end

  def object_params
    params.require(:order_item)
      .permit(
        :product_id, :quantity, :order_id
      )
  end

  def url_after_create
    edit_admin_order_item_path(@order.id, collection_scope.last.id)
  end

end
