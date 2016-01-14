class ChangePositionToNumberInAcademicDaySchedule < ActiveRecord::Migration
  def change
    rename_column :academic_day_schedules, :position, :number
  end
end
