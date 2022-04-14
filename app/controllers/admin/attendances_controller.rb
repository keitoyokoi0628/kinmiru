class Admin::AttendancesController < ApplicationController
  layout 'admin'
  def index
    @attendances = Attendance.all
  end

  def show
    @customer = Customer.find(params[:id])
    @attendance = @customer.attendances
  end

  def edit
  end

  def update
  end

end
