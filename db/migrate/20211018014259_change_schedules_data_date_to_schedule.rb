class ChangeSchedulesDataDateToSchedule < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :schedules_date, :time
  end
end
