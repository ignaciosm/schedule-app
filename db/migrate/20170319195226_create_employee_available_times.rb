class CreateEmployeeAvailableTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_available_times do |t|
      t.references :employee, foreign_key: true
      t.references :available_time, foreign_key: true

      t.timestamps
    end
  end
end
