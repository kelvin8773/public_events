module SessionsHelper

    def current_user
      if (user_id = session[:user_id])
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