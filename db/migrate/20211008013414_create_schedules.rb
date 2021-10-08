class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :itenerary_id
      t.date :schedules_date
      t.time :schedules_time
      t.string :schedules_title
      t.text :schedules_comment

      t.timestamps
    end
  end
end
