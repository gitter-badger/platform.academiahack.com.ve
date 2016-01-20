class AddMentorTokenToAcademicDaySchedules < ActiveRecord::Migration
  def change
    add_column :academic_day_schedules, :mentor_token, :string
  end
end
