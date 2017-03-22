class CreateSetTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :set_times do |t|
      t.string :start_time
      t.string :end_time
      t.string :day_of_week
      t.references :employee, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
