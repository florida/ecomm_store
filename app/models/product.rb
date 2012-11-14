class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock_no, :image_url
  has_many :lineitems
  validates :description, :presence => true
  validates :name, :presence => true
  validates :price, :numericality => true, :presence => true
  validates :stock_no, :numericality => { :only_integer => true }
  validates :image_url, :presence => true, :format => { :with => %r{\.(gif|jpe?g|png)$}i }
end
