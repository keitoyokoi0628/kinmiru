class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|

      t.integer :customer_id
      t.string :location

      t.timestamps
    end
  end
end
