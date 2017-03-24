class CreateAvailableTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :available_times do |t|
      t.string :day_of_week
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
