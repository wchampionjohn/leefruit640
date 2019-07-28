class Admin::Products::SpecsController < ResourcesController

  before_action :authenticate_admin!
  layout "admin"

  before_action only: [:new, :edit, :update, :create] do
    @product = ::Product.find params[:product_id]
  end

  def collection_scope
    ::Product::Spec.all.order(:product_id, :seq)
  end

  def object_params
    params.require(:product_spec)
      .permit(
    :title, :price, :product_id, :image, :seq
    )
  end

  def switch_seq
    specs  = ::Product.find(params[:product_id]).specs
    source = specs.find(params[:id])
    target = specs.find(params[:target_id])

    source.seq = target.seq
    target.seq = source.seq_was
    source.save! and target.save!

    redirect_to edit_admin_product_path(params[:product_id])
  end

  def url_after_create
    edit_admin_product_spec_path(@product.id, collection_scope.last.id)
  end

end
