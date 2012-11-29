class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user 
  private

  before_filter :get_pages

  def get_pages
    @pages = Page.all
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
