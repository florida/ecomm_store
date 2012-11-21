class Lineitem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity, :unit_price
  belongs_to :product
  belongs_to :order

  # # # # next feature, receiving quantity...

  def self.add_product(product, order)
  	item = order.lineitems.build
  	item.quantity = 1
  	item.product = product
  	#record the price during the sale
  	item.unit_price = product.price
    item
  end 

  def self.add_from_cart_item(cart_item)
    lineitem = self.new
    lineitem.product = cart_item.product
    lineitem.quantity = cart_item.quantity
    lineitem.unit_price = cart_item.price
  end
end
