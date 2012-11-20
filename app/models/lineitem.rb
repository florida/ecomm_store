class Lineitem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity, :unit_price
  belongs_to :product
  belongs_to :order

  # # # # next feature, receiving quantity...

  def self.add_product(product)
  	item = self.new
  	item.quantity = 1
  	item.product = product
  	#record the price during the sale
  	item.unit_price = product.price
    item
  end 
end
