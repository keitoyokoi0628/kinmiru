class CreateEditings < ActiveRecord::Migration[6.1]
  def change
    create_table :editings do |t|

      t.integer :customer_id
      t.integer :attendance_id
      t.datetime :start
      t.datetime :end
      t.string :location
      t.string :cause
      t.integer :is_active
      t.timestamps
    end
  end
end
