class UsersController < ApplicationController
  def new
  	@user = User.new
    @provinces = Province.all
  end

  def create
    @provinces = Province.all
  	@user = User.new(params[:user])
  	if @user.save
      #flash[:notice] => "Signed Up!"
  		redirect_to root_url
  		
  	else
  		render "new"
  	end
  end
end
