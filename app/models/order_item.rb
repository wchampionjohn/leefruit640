class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, class_name: 'Product::Spec', foreign_key: 'product_id'

  def full_product_title
    "#{product.product.name} - #{product.title}"
  end
  def price
    if product.nil?
      0
    else
      product.price * quantity
    end
  end
end
