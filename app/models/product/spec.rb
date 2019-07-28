class Product::Spec < ApplicationRecord
  belongs_to :product

  validates_presence_of :title, :price

  mount_uploader :image, ProductSpecImageUploader

  before_create do
    self.seq = self.class.where(product_id: self.product_id).size + 1
  end

  def full_title
    "#{product.title} - #{title}"
  end

end
