class AddEmployeeToShifts < ActiveRecord::Migration[5.0]
  def change
    add_column :shifts, :employee_id, :integer
  end
end
