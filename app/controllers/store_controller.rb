class StoreController < ApplicationController
  def index
  	@products = Product.available_items
  end

  def add_to_cart
  	product = Product.find(params[:id])
  	@cart = get_cart
  	@cart.add_cart_item(product)

  	redirect_to store_path
  end

  def show_cart
  	@cart = get_cart
  	@items = @cart.items
    if @items.empty?
      redirect_to store_path
      flash[:notice] = "Your cart is currently empty"
    else 
      render 'shoppingcart'
    end

  end

  def save_order
    @order = Order.new(params[:order])
    @cart = get_cart
    @order.add_products_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to root_path
      flash[:notice] = "Your order has been placed"
    else
      render :controller => :store, :action => :checkout
    end
  end

  def empty_cart
    @cart = get_cart
    @cart.empty_cart_contents!
    flash[:notice] = ' Your cart is now empty'
    redirect_to store_path
  end

  def checkout
    @cart = get_cart
    @order = Order.new
    @items = @cart.items
    if @items.empty?
      redirect_to root_path("There's nothing in your cart")
    end
  end

private

  def get_cart
  	session[:cart] ||= Cart.new
  end


end
