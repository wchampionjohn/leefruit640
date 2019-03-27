class Order < ApplicationRecord
  has_many :order_items
  belongs_to :city
  belongs_to :area

  validates_presence_of :name, :address, :city, :area

  def total_product
    order_items.reduce(0) { |result, item| result += item.quantity }
  end

  def total_price
    order_items.reduce(0) { |result, item| result += item.price }
  end

  def product_title
    order_items.first.product.product.title
  end

  def full_address
    "#{city.name}#{area.name}#{address}"
  end

  #state_machine :initial => :pending do

    #event :confirm do
      #transition :pending => :confirmed
    #end

    #event :ship do
      #transition :confirmed => :shipping
    #end

    #event :deliver do
      #transition :shipping => :delivered
    #end

    #event :refund do
      #transition :confirm => :refunded
    #end

    #event :complain_shipping do
      #transition :shipping => :complained
    #end

    #event :complain_deliver do
      #transition :delivered => :complained
    #end
  #end

end
