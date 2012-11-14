class Product < ActiveRecord::Base
  attr_accessible :desccription, :name, :price, :stock_no
  has_many :lineitems
  validates :description, :presence => true
  validates :name, :presence => true
  validates :price, :numericality => true, :presence => true
  validates :stock_no, :numericality => { :only_integer => true }
end
