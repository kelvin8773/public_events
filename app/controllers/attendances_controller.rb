class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    
    attended_event = Event.find_by(id: @attendance.attended_event_id)
    if @attendance.save
      flash[:success] = "You attended the event - #{attended_event.title}!"
      redirect_to event_path(attended_event)
    else
      flash[:error] = "Something went wrong, please try again!"
      redirect_to event_path(attended_event)
    end

  end
  
  
  def destroy
      @attendance = Attendance.find_by(attendance_params)
      if @attendance.destroy
        flash[:success] = "You have leaved this event!"
        redirect_to event_path(params[:id])
      else
        flash[:warning] = "You can't leave this event!"
        redirect_to event_path(params[:id])
      end

  end
    

  private
    def attendance_params
      params.require(:attendance).permit(:attendee_id, :attended_event_id)
    end

end
 