class Cart 
  #Model not persisted in the database
  #Cart will have items, cart will have a total price
  # and tax

  #feature to add... adding line items with quantity

  attr_reader :items, :total_price, :order
  def initialize
  	@items = []
    @total_price = 0.0
  end


  def add_cart_item(product)
  	#finds if item is already in the cart
  	item = @items.find {|item| item.product == product }

  	if item 
  		item.increment_quantity
  	else
  		item = CartItem.new(product)

  		@items << item
  	end
    @total_price += item.price
    item
  end

  def empty_cart_contents!
    @items = []
    @total_price = 0.0
  end

  def grand_total taxes
    pst_total = taxes[:pst] * @total_price
    hst_total = taxes[:hst] * @total_price
    gst_total = taxes[:gst] * @total_price

    pst_total + hst_total+ gst_total + @total_price
  end

  def total_with_tax tax
    @total_price * tax
  end

end
