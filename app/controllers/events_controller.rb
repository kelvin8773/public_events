class EventsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :edit, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    
    if @event.save
      flash[:success] = "Event Saved!"
      @attendance = Attendance.new(attendee_id: params[:event][:creator_id].to_i, attended_event_id: @event.id )
      @attendance.save
      redirect_to root_url
    else
      flash.now[:warning] = "Evnet Can't save!"
      render :new
    end

  end

  def index
    @events = Event.all 
  end

  def show
    @event = Event.find_by(id: params[:id]) 
  end

  def edit
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :event_date, :location, :creator_id)
  end



end
