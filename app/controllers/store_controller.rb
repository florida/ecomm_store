class StoreController < ApplicationController
  def index
  	@products = Product.available_items
  end

end
