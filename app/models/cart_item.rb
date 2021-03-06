class CartItem
  attr_reader :product_id, :quantity

  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

  def increment quantity
    @quantity = @quantity + quantity
  end

  def quantity= quantity
    @quantity = quantity
  end

  def product
    Product::Spec.find_by(id: product_id)
  end

  def price
    product.price * quantity
  end
end
