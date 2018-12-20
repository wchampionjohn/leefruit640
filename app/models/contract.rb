class Contract < ApplicationRecord
  validates_presence_of :message, :name
end
