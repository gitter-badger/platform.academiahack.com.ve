class AddMentorStatusToAcademicDaySchedules < ActiveRecord::Migration
  def change
    add_column :academic_day_schedules, :mentor_status, :integer
  end
end
