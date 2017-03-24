class AddAdminToAvailableTimes < ActiveRecord::Migration[5.0]
  def change
    add_reference :available_times, :admin, foreign_key: true
  end
end
