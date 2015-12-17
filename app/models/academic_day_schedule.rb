# == Schema Information
#
# Table name: academic_day_schedules
#
#  id                        :integer          not null, primary key
#  position                  :integer
#  schedule                  :date
#  academic_week_schedule_id :integer
#  day_id                    :integer
#

class AcademicDaySchedule < ActiveRecord::Base
  belongs_to :academic_week_schedule
  belongs_to :day
end
