class AddMentorToAcademicDaySchedule < ActiveRecord::Migration
  def change
    add_reference :academic_day_schedules, :mentor, index: true
  end
end
