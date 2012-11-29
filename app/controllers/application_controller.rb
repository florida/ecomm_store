class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user 
  private

  before_filter :get_pages, :get_footer_links

  def get_pages
    @pages = Page.all
  end

  def get_footer_links
  	@footer_links = FooterLink.all
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
