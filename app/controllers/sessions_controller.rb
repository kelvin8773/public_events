class SessionsController < ApplicationController
  def new 
  end 

 def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in(user) 
        flash[:success] = 'You are logged in!'
        redirect_to root_url  
    elsif user.nil?
          flash.now[:warning] = 'This user is not register!!'
          render 'new'          
    else 
        flash.now[:warning] = 'This user is not register!!'
        render 'new'
    end
  end

  def destroy
      log_out if logged_in?
      flash[:success] = 'You have just signed out!'
      redirect_to login_path
  end
  
end
