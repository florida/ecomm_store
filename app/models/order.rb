class Order < ActiveRecord::Base
  ORDER_STATUS = ["Shipped", "Pending", "Order Requested"] 
  attr_accessible :address, :email, :first_name, :last_name, :status
  has_many :lineitems
  validates :address, :presence => true
  validates :email, :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates_inclusion_of :status, :in => ORDER_STATUS

  def add_products_from_cart(cart)
  	cart.items.each do |item|
  		lineitem = Lineitem.add_from_cart_item(item)
  		lineitems << li
  	end
  end

end
