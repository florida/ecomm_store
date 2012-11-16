class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock_no, :image_url, :available
  has_many :lineitems
  validates :description, :presence => true
  validates :name, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }, :presence => true
  validates :stock_no, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :image_url, :presence => true, :format => { :with => %r{\.(gif|jpe?g|png)$}i }


  def self.available_items
  	find(:all,
  		 :conditions => { :available => true} )
  end 

end
