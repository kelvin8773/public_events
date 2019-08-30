
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    if logged_in?
      @event = current_user.events.build
      @attended_events = current_user.attended_events
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
