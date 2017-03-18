class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.string :day_of_week
      t.string :start_time
      t.string :end_time
      t.string :position

      t.timestamps
    end
  end
end
