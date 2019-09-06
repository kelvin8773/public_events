# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    return unless logged_in?
      @user = User.find(params[:id])
      @event = @user.events.build
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :avatar)
  end
end
