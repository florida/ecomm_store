class Order < ActiveRecord::Base
  ORDER_STATUS = ["Shipped", "Pending", "Order Requested"] 
  attr_accessible :address, :email, :first_name, :last_name, :status
  has_many :lineitems
  validates :address, :presence => true
  validates :email, :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates_inclusion_of :status, :in => ORDER_STATUS
end
