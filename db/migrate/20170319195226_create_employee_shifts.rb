class CreateEmployeeShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_shifts do |t|
      t.references :employee, foreign_key: true
      t.references :shift, foreign_key: true

      t.timestamps
    end
  end
end
