class Product::Spec < ApplicationRecord
  belongs_to :product

  validates_presence_of :title, :price

  mount_uploader :image, ProductSpecImageUploader

  def full_title
    "#{product.title} - #{title}"
  end

end
