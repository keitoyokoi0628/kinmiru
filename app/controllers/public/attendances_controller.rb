class Public::AttendancesController < ApplicationController

  def index
    @attendances = current_customer.attendances
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @attendances = current_customer.attendances.where(updated_at: @month.all_month)
  end

  def new
    @customer = current_customer
    if current_customer.attendances.exists?(start: Time.zone.now.all_day)
    @attendance = current_customer.attendances.last
    else
    @attendance = Attendance.new
    end
  end

  def create
    @customer = current_customer
    @attendance = Attendance.new(attendance_params)
    @attendance.start = Time.current
    @attendance.customer_id = current_customer.id
    if @attendance.save
     redirect_to attendances_path
    else
     render :new
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    @attendance.end = Time.current
    @attendance.is_active = 0
    @attendance.save
    redirect_to attendances_path
  end


  def timesedit
     @attendance = Attendance.find(params[:id])
  end

  def timesupdate
    @attendance = Attendance.find(params[:id])
    @attendance.is_active = 1
    @attendance.validate_attributes = true
    if @attendance.update(attendance_params)
       redirect_to attendances_path, notice: '勤怠修正を申請しました。'
    else
     flash.now[:danger] = 'すべての項目を入力してください。'
     render :timesedit
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:start, :customer_id, :location, :is_active, :re_start, :re_end, :cause, :re_location )
  end

end
