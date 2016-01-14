class AddStatusToAcademicDaySchedule < ActiveRecord::Migration
  def change
    add_column :academic_day_schedules, :status, :integer
  end
end
