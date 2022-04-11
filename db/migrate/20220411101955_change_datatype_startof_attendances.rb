class ChangeDatatypeStartofAttendances < ActiveRecord::Migration[6.1]
  def change
    change_column :attendances, :start, :datetime
  end
end
