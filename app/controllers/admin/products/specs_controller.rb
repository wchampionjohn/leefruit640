class Admin::Products::SpecsController < ResourcesController

  before_action :authenticate_admin!
  layout "admin"

  before_action only: [:new, :edit, :update, :create] do
    @product = ::Product.find params[:product_id]
  end

  def collection_scope
    ::Product::Spec.all
  end

  def object_params
    params.require(:product_spec)
      .permit(
    :title, :price, :product_id, :image
    )
  end

  def url_after_create
    edit_admin_product_spec_path(@product.id, collection_scope.last.id)
  end

end
