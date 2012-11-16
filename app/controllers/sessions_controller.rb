class SessionsController < ApplicationController
  def new
  end
  
  def create 
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    end
      flash.now.alert = "Email or Password was invalid"
      render :new
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Logged Out!"
  end
  
end
