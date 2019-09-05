# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = 'You are logged in!'
      redirect_to root_url
    elsif user.nil?
      flash.now[:warning] = 'This Emails is not register!'
      render 'new'
    else
      flash.now[:warning] = 'Password is incorrect, Try again'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'You have just signed out!'
    redirect_to login_path
  end
end
