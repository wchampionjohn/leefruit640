class Admin::OrdersController < ResourcesController
  before_action :authenticate_admin!

  layout "admin"

  def current_collection
    ::Order.all
  end

  def permitted_attributes
    [
      :user, :state, :delivered_at, :shipped_at, :delivery_way,
      :name, :city, :area, :address, :phone, :note
    ]
  end

  def model_class_name
    'Order'
  end
end
