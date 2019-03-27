class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, class_name: 'Product::Spec', foreign_key: 'product_spec_id'

  def price
    product.price * quantity
  end
end
