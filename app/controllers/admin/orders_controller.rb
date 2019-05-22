class Admin::OrdersController < ResourcesController
  before_action :authenticate_admin!

  layout "admin"

  def collection_scope
    ::Order.all
  end

  def object_params
    params.require(:order)
      .permit(
        :user, :state, :delivered_at, :shipped_at,
        :name, :city, :area, :address, :phone, :note,
      )
  end
end
