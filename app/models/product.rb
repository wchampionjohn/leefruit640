class Product < ApplicationRecord
  has_many :images
  has_many :specs
end
