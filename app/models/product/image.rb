class Product::Image < ApplicationRecord
  belongs_to :product
  mount_uploader :file, ProductImageUploader
end
