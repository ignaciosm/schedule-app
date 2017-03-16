class AddStatusToShifts < ActiveRecord::Migration[5.0]
  def change
    add_column :shifts, :status, :string, default: 'active'
  end
end
