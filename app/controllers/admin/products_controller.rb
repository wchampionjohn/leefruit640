class Admin::ProductsController < ResourcesController

  before_action :authenticate_admin!

  layout "admin"

  def new
    Product.new.save(validate: false)
    redirect_to edit_admin_product_path(Product.last.id)
  end

  def current_collection
    ::Product.where(is_finish: true)
  end

  def permitted_attributes
    [
      :name, :price, :description,
      :description_2, :is_public,
    ]
  end
end
