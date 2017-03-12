class AddAdminToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :admin, foreign_key: true
  end
end
