class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock_no, :image_url, :available, :category_id, :image

  scope :unavailable, where(:available => nil || :available.empty?)
  has_many :lineitems
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates :description, :presence => true
  validates :name, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }, :presence => true
  validates :stock_no, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :image_url, :presence => true, :format => { :with => %r{\.(gif|jpe?g|png)$}i }
  belongs_to :category

  def self.available_items
  	find(:all,
  		 :conditions => { :available => true} )
  end 

end
