class Cart 
  #Model not persisted in the database
  #Cart will have items, cart will have a total price
  # and tax

  #feature to add... adding line items with quantity

  attr_reader :items, :total_price, :taxes, :order
  def initialize
  	@items = []
  end


  def add_cart_item(product)
  	#finds if item is already in the cart
  	item = @items.find {|item| item.product == product }

  	if item 
  		item.increment_quantity
  	else
  		item = Cart::CartItem.new(product)
  		@items << item
  	end
    item
  end

  def empty_cart_contents!
    @items = []
  end


end
