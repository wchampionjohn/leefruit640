class Product < ApplicationRecord
  has_many :images
  has_many :specs
  scope :publish, -> { where(is_finish: true).where(is_public: true) }

  validates_presence_of :name, :price, :description, :description_2

  before_update do
    self.is_finish ||= true
  end

end
