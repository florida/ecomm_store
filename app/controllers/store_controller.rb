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
  	render 'shoppingcart'
  end

  def empty_cart
    @cart = get_cart
    @cart.empty_cart_contents!
    flash[:notice] = ' Your cart is now empty'
    redirect_to store_path
  end

  def checkout
    @cart = get_cart
    @items = @cart.items
    if @items.empty?
      redirect_to root_path("There's nothing in your cart")
    else
      @order = Order.new
    end
  end

private

  def get_cart
  	session[:cart] ||= Cart.new
  end



end
