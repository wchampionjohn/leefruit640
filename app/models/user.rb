class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :city
  belongs_to :area
  has_many :orders

  def full_address
    "#{city.name}#{area.name}#{address}"
  end
end
