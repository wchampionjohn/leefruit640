class Admin::ProductsController < ResourcesController

  before_action :authenticate_admin!

  layout "admin"

  def new
    current_object.save(validate: false)
    redirect_to edit_admin_product_path(Product.last.id)
  end

  def collection_scope
    ::Product.where(is_finish: true)
  end

  def object_params
    params.require(:product)
      .permit(
    :name, :price, :description, :description_2, :is_public,
    )
  end
end
