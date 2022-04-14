class AddReEndToAttendance < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :re_end, :datetime
  end
end
