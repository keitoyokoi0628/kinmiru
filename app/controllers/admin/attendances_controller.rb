class Admin::AttendancesController < ApplicationController
  layout 'admin'
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
    
  end

end
