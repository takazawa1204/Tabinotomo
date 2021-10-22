class ChangeDataTimeToSchedule < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :schedules_time, :datetime
  end
end
