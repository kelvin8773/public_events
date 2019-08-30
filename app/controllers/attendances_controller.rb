class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    
    if @attendance.save
      attended_event = Event.find_by(id: @attendance.attended_event_id)
      flash[:success] = "You attended the event - #{attended_event.title}!"
      redirect_to event_path(attended_event)
    else
      flash.now[:error] = "Something went wrong, please try again!"
      redirect_to event_path(attended_event)
    end
    
  end

  private
    def attendance_params
      params.require(:attendance).permit(:attendee_id, :attended_event_id)
    end

end
 