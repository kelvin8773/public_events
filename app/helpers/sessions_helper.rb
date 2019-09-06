# frozen_string_literal: true

module SessionsHelper
  def current_user?(user)
    user == current_user
  end

  def current_user
    return unless user_id == session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:user_id] = nil
    @current_user = nil
  end
end
