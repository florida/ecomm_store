class Lineitem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity, :unit_price
  belongs_to :product
  belongs_to :order
end
