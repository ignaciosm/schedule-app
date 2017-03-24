class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.string :start_time
      t.string :end_time
      t.integer :employee_id

      t.timestamps
    end
  end
end
