class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|

      t.integer :customer_id
      t.integer :location_id
      t.time :start
      t.time :end
      t.string :location
      t.integer :is_active
      t.timestamps
    end
  end
end
