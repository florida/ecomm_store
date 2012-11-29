class Page < ActiveRecord::Base
  attr_accessible :content, :permalink, :title
end