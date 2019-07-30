class Admin::Products::SpecsController < ResourcesController

  before_action :authenticate_admin!
  layout "admin"

  before_action only: [:new, :edit, :update, :create] do
    @product = ::Product.find params[:product_id]
  end

  def current_collection
    ::Product::Spec.all.order(:product_id, :seq)
  end

  def permitted_attributes
    [
      :title, :price, :product_id, :image, :seq
    ]
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

  def action_after_create
    edit_admin_product_spec_path(@product.id, current_collection.last.id)
  end

  def param_key
    "product_spec"
  end

  def model_class_name
    "Product::Spec"
  end

end
