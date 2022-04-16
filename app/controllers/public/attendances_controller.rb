class Public::AttendancesController < ApplicationController

  def index
    @attendances = current_customer.attendances
  end

  def new
    if current_customer.attendances.exists?(start: Time.zone.now.all_day)
    @attendance = current_customer.attendances.last
    else
    @attendance = Attendance.new
    end
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.start = Time.current
    @attendance.customer_id = current_customer.id
    @attendance.save!
    redirect_to new_attendance_path
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    @attendance.end = Time.current
    @attendance.is_active = 0
    @attendance.save
    redirect_to new_attendance_path
  end


  def timesedit
     @attendance = Attendance.find(params[:id])
  end

  def timesupdate
    @attendance = Attendance.find(params[:id])
    @attendance.is_active = 1
    @attendance.update(attendance_params)
    redirect_to new_attendance_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:start, :customer_id, :location, :is_active, :re_start, :re_end, :cause )
  end

end
