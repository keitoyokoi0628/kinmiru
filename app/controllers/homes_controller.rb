class HomesController < ApplicationController
  def top
    @attendance = Attendance.new
  end
end
