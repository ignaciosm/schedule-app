class AddDayOfWeekToShifts < ActiveRecord::Migration[5.0]
  def change
    add_column :shifts, :day_of_week, :string
  end
end
