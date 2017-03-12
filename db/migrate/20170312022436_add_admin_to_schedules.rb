class AddAdminToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_reference :schedules, :admin, foreign_key: true, default: 1
  end
end
