class AddAdminToShifts < ActiveRecord::Migration[5.0]
  def change
    add_reference :shifts, :admin, foreign_key: true
  end
end
