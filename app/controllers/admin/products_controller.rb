class Admin::ProductsController < ResourcesController

  layout "admin"

  def new
    current_object.save(validate: false)
    redirect_to edit_admin_product_path(current_object.id)
  end

  def collection_scope
    ::Product.all
  end

  def object_params
    params.require(:product)
      .permit(
    :name, :price, :description, :description_2, :is_public,
    )
  end
end
