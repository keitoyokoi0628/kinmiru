class AddCauseToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :cause, :string
  end
end
