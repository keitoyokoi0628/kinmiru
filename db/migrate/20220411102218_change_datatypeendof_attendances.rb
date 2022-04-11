class ChangeDatatypeendofAttendances < ActiveRecord::Migration[6.1]
  def change
    change_column :attendances, :end, :datetime
  end
end
