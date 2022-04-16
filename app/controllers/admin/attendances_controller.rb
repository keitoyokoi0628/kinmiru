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
  end

end
