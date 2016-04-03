# == Schema Information
#
# Table name: academic_week_schedules
#
#  id         :integer          not null, primary key
#  position   :integer
#  promo_id   :integer
#  week_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class AcademicWeekSchedule < ActiveRecord::Base
  belongs_to :promo
  belongs_to :week
  has_many :academic_day_schedules, dependent: :destroy
  scope :ordered,      -> { order('position ASC') }

  def self.current_week_number
    black_days = 0
    current_calendar_day = DateTime.now.to_date
    Promo.current.start_date.upto(current_calendar_day) do |date|
      black_days += 1 if day_unavailable?(date)
    end

    diff = (current_calendar_day.to_date - Promo.current.start_date) - black_days + 1
    diff < 0 ? 0 : (diff/5).ceil
  end

  def self.calculate_htd
    #Get current promo
    current_promo = Promo.current
    academic_week_schedules = AcademicWeekSchedule.where promo: current_promo
    AcademicWeekSchedule.schedule current_promo.start_date, academic_week_schedules
  end

  private
  def self.day_unavailable? day
    #Revisar si el dia es sabado o domingo
    if day.saturday? || day.sunday?
      return true
    end
    #Revisar si el dia esta en el blacklist
    black_days = BlackDay.all
    black_days.each do |black_day|
      unless black_day.black_date
        #Armar la fecha si es recurrente con el ano actual
        current_year = Date.today.strftime("%Y")
        black_day.black_date = DateTime.new(current_year, black_day.month, black_day.day)
      end
      if black_day.black_date == day
        return true
      end
    end
    false
  end

  def self.schedule start_date, academic_week_schedules
    current_calendar_day = start_date
    academic_week_schedules.each do |academic_week_schedule|
      academic_week_schedule.academic_day_schedules.each do |academic_day_schedule|
        while AcademicWeekSchedule.day_unavailable?(current_calendar_day)
          current_calendar_day += 1
        end
        academic_day_schedule.schedule = current_calendar_day
        academic_day_schedule.save
        current_calendar_day += 1
      end
    end
  end
end
