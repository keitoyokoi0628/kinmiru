class AddReStartToAttendance < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :re_start, :datetime
  end
end
