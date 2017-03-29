class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :business_year
      t.integer :business_week

      t.timestamps
    end
  end
end
