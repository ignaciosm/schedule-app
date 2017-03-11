class AddPositionToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :position, :string, default: 'manager'
  end
end
