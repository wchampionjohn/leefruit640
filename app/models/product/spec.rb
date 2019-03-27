class Product::Spec < ApplicationRecord
  belongs_to :product
  mount_uploader :image, ProductSpecImageUploader

  def full_title
    "#{product.title} - #{title}"
  end

end
