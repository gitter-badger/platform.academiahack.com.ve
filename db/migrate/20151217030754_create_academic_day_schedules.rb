class CreateAcademicDaySchedules < ActiveRecord::Migration
  def change
    create_table :academic_day_schedules do |t|
      t.integer :position
      t.date :schedule
      t.references :academic_week_schedule, index: true
      t.references :day, index:true
    end
  end
end
