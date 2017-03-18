class AddNameAndCompanyToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :company, :string
  end
end
