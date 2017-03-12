class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :biz_year
      t.integer :biz_week

      t.timestamps
    end
  end
end
