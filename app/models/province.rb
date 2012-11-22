class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  has_many :users
end
