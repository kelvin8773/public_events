class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    if logged_in?
      @user = current_user
      @event = @user.events.build
      @created_events = @user.events
      @attended_events = @user.attended_events
    end
  end


  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'User created'
      log_in(@user)
      redirect_to root_url
     else 
      render 'new'
    end

  end


  private
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit( :name, 
                                    :email,
                                    :password, 
                                    :password_confirmation
                                  )
    end
end
