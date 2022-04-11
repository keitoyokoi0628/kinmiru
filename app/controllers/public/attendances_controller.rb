class Public::AttendancesController < ApplicationController
  def index
    @attendances = current_customer.attendances
  end

  def new
    if Attendance.exists?(start: Time.zone.now.all_day)
    @attendance = Attendance.last
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
    @attendance.save
    redirect_to new_attendance_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:start, :customer_id, :location)
  end

end
