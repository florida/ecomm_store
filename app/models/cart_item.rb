class CartItem
  attr_reader :quantity, :product

  def initialize(product)
    @product = product
    @quantity = 1
  end

  def increment_quantity
    @quantity += 1
  end

  def name
    @product.name
  end

  def price 
    @product.price
  end
end