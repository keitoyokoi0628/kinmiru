class Admin::AttendancesController < ApplicationController
  layout 'admin'
  require 'csv'

  def top
    @attendances = Attendance.where(start: Time.zone.now.all_day)
  end

  def index
    @attendances = Attendance.where(is_active: "1")

  end

  def show
    @customer = Customer.find(params[:id])
    @attendance = @customer.attendances
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_attendances_csv(@attendance)
      end
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    if params[:approved]
      @attendance.start = @attendance.re_start
      @attendance.end = @attendance.re_end
      @attendance.location = @attendance.re_location
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
    params.permit(:start, :customer_id, :location, :is_active, :re_start, :re_end, :cause, :re_location )
  end

  def send_attendances_csv(attendances)
    csv_data = CSV.generate do |csv|
      column_names = %w(出勤時刻 退勤時刻 勤務地)
      csv << column_names
      attendances.each do |attendance|
        column_values = [
          attendance.start,
          attendance.end,
          attendance.location,
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "勤怠一覧.csv")
  end

end
