class StoreController < ApplicationController
  def index
  	@products = Product.available_items
  end

  def add_to_cart
  	product = Product.find(params[:id])
  	@cart = get_cart
  	@cart.add_line_item(product)

  	redirect_to store_path
  end

  def show_cart
  	@cart = get_cart
  	@items = @cart.items
  end


private

  def get_cart
  	session[:cart] ||= Cart.new
  end
end
