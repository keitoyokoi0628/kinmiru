class Admin::AttendancesController < ApplicationController
  layout 'admin'

  def top
    @attendances = Attendance.where(start: Time.zone.now.all_day)
  end

  def index
    @attendances = Attendance.where(is_active: "1")
  end

  def show
    @customer = Customer.find(params[:id])
    @attendance = @customer.attendances
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    if params[:approved]
      @attendance.start = @attendance.re_start
      @attendance.end = @attendance.re_end
      @attendance.is_active = 2
      @attendance.update(attendance_params)
      redirect_to admin_attendances_path
    else params[:negative]
      @attendance.is_active = 3
      @attendance.update(attendance_params)
      redirect_to admin_attendances_path
    end
  end

  private

  def attendance_params
    params.permit(:start, :customer_id, :location, :is_active, :re_start, :re_end, :cause )
  end

end
