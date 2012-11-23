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

    @provinces = Province.all
  	@cart = get_cart
  	@items = @cart.items
    if @items.empty?
      redirect_to store_path
      flash[:notice] = "Your cart is currently empty"
    else 
      render 'shoppingcart'
    end

  end

  def confirm_order

    user = ""
    @provinces = Province.all
    if session['user_id'].present?
      user = User.find(session[:user_id])
      @order = Order.new(:first_name => user.first_name, :last_name => user.last_name, :status => "Pending", :email => user.email, :address => user.address)
      @order.hst = user.province.hst
      @order.gst = user.province.gst
      @order.pst = user.province.pst
    else
      user = User.new(params[:user])
      @order = Order.new(:first_name => user.first_name, :last_name => user.last_name, :status => "Pending", :email => user.email, :address => user.address)
      @order.hst = user.province.hst
      @order.gst = user.province.gst
      @order.pst = user.province.pst
    end
    session[:order] = @order
    @cart = get_cart
    @items = @cart.items
  end

  def save_order
    @cart = get_cart

    @order = session[:order]
    @order.add_products_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      session[:order] = nil
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
    @user = User.new 
    if session['user_id'].present?
      @user = User.find(session[:user_id]) 
    end

    @cart = get_cart
    
    @provinces = Province.all

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
