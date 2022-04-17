class AddReLocationToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :re_location, :string
  end
end
