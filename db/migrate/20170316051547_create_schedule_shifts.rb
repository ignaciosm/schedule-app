class CreateScheduleShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_shifts do |t|
      t.references :schedule, foreign_key: true
      t.references :shift, foreign_key: true

      t.timestamps
    end
  end
end
