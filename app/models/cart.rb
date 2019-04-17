class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_item(id, quantity = 1)
    # find item
    item = items.find { |t| t.product_id == id }

    if item
      item.increment quantity
    else
      items << CartItem.new(id, quantity)
    end
  end

  def update_quantity(id, quantity)
    item = items.find { |t| t.product_id == id }
    item.quantity = quantity
  end

  def destroy_item id
    items.delete_if { |t| t.product_id == id }
  end

  def empty?
    items.empty?
  end

  def serialize
    {
      "cart" => { "items" => items.map { |t| {"product_id" => t.product_id , "quantity" => t.quantity} } }
    }
  end

  def self.build_from_hash(hash)
    if hash.nil?
      new []
    else
      new hash["cart"]["items"].map { |item_hash|
        CartItem.new(item_hash["product_id"], item_hash["quantity"])
      }
    end
  end

  def total_price
    items.inject(0) { |s, item| s + item.price }
  end

  def items_count
    items.inject(0) { |s, item| s + item.quantity }
  end

  def clear!
    @item = []
  end
end
