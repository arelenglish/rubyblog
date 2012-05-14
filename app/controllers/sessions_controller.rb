class SessionsController < ApplicationController
  skip_before_filter :login_required
  
  def new
  end
  
  def create
    #load the user from their email
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Loged In!"
    else
      render :new, :notice => "Unable to Login"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged Out"
  end
end
