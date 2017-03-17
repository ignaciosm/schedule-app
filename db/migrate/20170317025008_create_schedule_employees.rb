class CreateScheduleEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_employees do |t|
      t.references :schedule, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
